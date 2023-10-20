import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_list_entity.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_prefrences.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'model/media_list_status.dart';

abstract class MediaListRepository {
  Future<List<MediaListItemModel>> getUserAnimeList(
      {required List<MediaListStatus> status,
      int page = 1,
      int? userId,
      int perPage = Config.defaultPerPageCount});

  Stream<List<MediaListItemModel>> getUserAnimeListStream(
      {required List<MediaListStatus> status, required String userId});

  Future<LoadResult<void>> syncUserAnimeList(
      {String? userId,
      List<MediaListStatus> status = const [],
      MediaType? mediaType});

  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type});

  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId});

  /// update anime in anime tracking list.
  Future<LoadResult<void>> updateAnimeInTrackList(
      {required String animeId,
      required MediaListStatus status,
      String? entryId,
      int? progress,
      int? score});
}

class MediaListRepositoryImpl extends MediaListRepository {
  final MediaListDao animeTrackListDao = AniflowDatabase().getMediaListDao();
  final UserDataDao userDataDao = AniflowDatabase().getUserDataDao();
  final MediaInformationDao animeListDao =
      AniflowDatabase().getMediaInformationDaoDao();
  final AniListDataSource aniListDataSource = AniListDataSource();
  final AuthDataSource authDataSource = AuthDataSource();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<List<MediaListItemModel>> getUserAnimeList(
      {required List<MediaListStatus> status,
      int page = 1,
      int? userId,
      int perPage = Config.defaultPerPageCount}) async {
    final targetUserId = userId ?? (await userDataDao.getUserData())?.id;
    if (targetUserId == null) {
      /// No user.
      return [];
    }

    final animeList = await animeTrackListDao.getMediaListByPage(
        targetUserId.toString(), status,
        page: 1, perPage: null);

    return animeList
        .map((e) => MediaListItemModel.fromDataBaseModel(e))
        .toList();
  }

  @override
  Future<LoadResult<void>> syncUserAnimeList(
      {String? userId,
      List<MediaListStatus> status = const [],
      MediaType? mediaType}) async {
    try {
      final targetUserId = userId ?? (await userDataDao.getUserData())?.id;
      if (targetUserId == null) {
        /// No user.
        return LoadError(Exception('no user'));
      }

      /// get all anime list items from network.
      final networkAnimeList = await aniListDataSource.getUserMediaListPage(
        param: UserAnimeListPageQueryParam(
          page: 1,
          perPage: null,
          mediaType: mediaType,
          status: status,
          userId: int.parse(targetUserId.toString()),
        ),
      );

      /// insert animeList to database.
      final animeListEntity = networkAnimeList
          .map((e) => MediaListEntity.fromNetworkModel(e))
          .toList();
      await animeTrackListDao.insertMediaListEntities(animeListEntity);

      /// insert anime to database.
      final animeEntities = networkAnimeList
          .map<MediaEntity?>(
            (e) =>
                e.media != null ? MediaEntity.fromNetworkModel(e.media!) : null,
          )
          .whereType<MediaEntity>()
          .toList();
      await animeListDao.upsertMediaInformation(animeEntities,
          conflictAlgorithm: ConflictAlgorithm.ignore);

      animeTrackListDao.notifyMediaListChanged(targetUserId);
      return LoadSuccess(data: null);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Stream<List<MediaListItemModel>> getUserAnimeListStream(
      {required List<MediaListStatus> status, required String userId}) {
    return animeTrackListDao.getMediaListStream(userId, status).map(
          (models) => models
              .map((e) => MediaListItemModel.fromDataBaseModel(e))
              .toList(),
        );
  }

  @override
  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type}) {
    return animeTrackListDao.getMediaListMediaIdsByUserStream(
        userId, status, type);
  }

  @override
  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId}) {
    return animeTrackListDao.getIsTrackingByUserAndIdStream(
        userId: userId, mediaId: animeId);
  }

  @override
  Future<LoadResult<void>> updateAnimeInTrackList(
      {required String animeId,
      required MediaListStatus status,
      String? entryId,
      int? progress,
      int? score}) async {
    final entity = await animeTrackListDao.getMediaListItem(
        mediaId: animeId, entryId: entryId);
    final targetUserId = (await userDataDao.getUserData())?.id;

    if (targetUserId == null) {
      /// no login, return with error.
      return LoadError(const UnauthorizedException());
    }

    if (entity != null) {
      /// the tracking anime is already cached in database.
      /// change the local database and notify the to ui without waiting
      /// network result.
      final updatedEntity = entity.copyWith(
        status: status,
        progress: progress ?? entity.progress,
        score: score ?? entity.progress,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await animeTrackListDao.insertMediaListEntities([updatedEntity]);
      animeTrackListDao.notifyMediaListChanged(targetUserId);
    }

    try {
      /// post mutation to network and insert result to database.
      final result = await authDataSource.saveAnimeToAnimeList(
          MediaListMutationParam(
              entryId: int.tryParse(entryId ?? ''),
              mediaId: int.parse(animeId),
              progress: progress,
              status: status,
              score: 0));
      final updateEntity = MediaListEntity.fromNetworkModel(result);
      await animeTrackListDao.insertMediaListEntities([updateEntity]);
      animeTrackListDao.notifyMediaListChanged(targetUserId);
      return LoadSuccess(data: null);
    } on NetworkException catch (exception) {
      /// network error happened.
      /// revert the changes in database.
      if (entity != null) {
        await animeTrackListDao.insertMediaListEntities([entity]);
      }
      animeTrackListDao.notifyMediaListChanged(targetUserId);
      return LoadError(exception);
    }
  }
}
