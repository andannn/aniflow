import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/anime_track_item_entity.dart';
import 'package:anime_tracker/core/database/anime_track_list_dao.dart';
import 'package:anime_tracker/core/database/user_data_dao.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:anime_tracker/core/network/api/user_anime_list_query_graphql.dart';
import 'package:anime_tracker/core/network/auth_data_source.dart';
import 'package:anime_tracker/core/network/util/http_status_util.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'model/anime_list_status.dart';

abstract class AniListRepository {
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required List<AnimeListStatus> status,
      int page = 1,
      int? userId,
      int perPage = Config.defaultPerPageCount});

  Stream<List<AnimeListItemModel>> getUserAnimeListStream(
      {required List<AnimeListStatus> status, required String userId});

  Future<LoadResult<void>> syncUserAnimeList({String? userId});

  Stream<Set<String>> getAnimeListAnimeIdsByUserStream(
      String userId, List<AnimeListStatus> status);

  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId});

  /// update anime in anime tracking list.
  Future<LoadResult<void>> updateAnimeInTrackList(
      {required String animeId,
      required AnimeListStatus status,
      String? entryId,
      int? progress,
      int? score});
}

class AnimeTrackListRepositoryImpl extends AniListRepository {
  final AnimeTrackListDao animeTrackListDao =
      AnimeDatabase().getAnimeTrackListDao();
  final UserDataDao userDataDao = AnimeDatabase().getUserDataDao();
  final AnimeListDao animeListDao = AnimeDatabase().getAnimeDao();
  final AniListDataSource aniListDataSource = AniListDataSource();
  final AuthDataSource authDataSource = AuthDataSource();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required List<AnimeListStatus> status,
      int page = 1,
      int? userId,
      int perPage = Config.defaultPerPageCount}) async {
    final targetUserId = userId ?? (await userDataDao.getUserData())?.id;
    if (targetUserId == null) {
      /// No user.
      return [];
    }

    final animeList = await animeTrackListDao.getUserAnimeListByPage(
        targetUserId.toString(), status,
        page: 1, perPage: null);

    return animeList
        .map((e) => AnimeListItemModel.fromDataBaseModel(e))
        .toList();
  }

  @override
  Future<LoadResult<void>> syncUserAnimeList({String? userId}) async {
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
          userId: int.parse(targetUserId.toString()),
        ),
      );

      /// insert animeList to database.
      final animeListEntity = networkAnimeList
          .map((e) => AnimeTrackItemEntity.fromNetworkModel(e))
          .toList();
      await animeTrackListDao.insertTrackingAnimeListEntities(animeListEntity);

      /// insert anime to database.
      final animeEntities = networkAnimeList
          .map<AnimeEntity?>(
            (e) => e.media != null
                ? AnimeEntity.fromDetailNetworkModel(e.media!)
                : null,
          )
          .whereType<AnimeEntity>()
          .toList();
      await animeListDao.upsertAnimeInformation(animeEntities,
          conflictAlgorithm: ConflictAlgorithm.replace);

      animeTrackListDao.notifyTrackingAnimeContentChanged(targetUserId);
      return LoadSuccess(data: []);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Stream<List<AnimeListItemModel>> getUserAnimeListStream(
      {required List<AnimeListStatus> status, required String userId}) {
    return animeTrackListDao.getUserAnimeListStream(userId, status).map(
          (models) => models
              .map((e) => AnimeListItemModel.fromDataBaseModel(e))
              .toList(),
        );
  }

  @override
  Stream<Set<String>> getAnimeListAnimeIdsByUserStream(
      String userId, List<AnimeListStatus> status) {
    return animeTrackListDao.getAnimeListAnimeIdsByUserStream(userId, status);
  }

  @override
  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId}) {
    return animeTrackListDao.getIsTrackingByUserAndIdStream(
        userId: userId, animeId: animeId);
  }

  @override
  Future<LoadResult<void>> updateAnimeInTrackList(
      {required String animeId,
      required AnimeListStatus status,
      String? entryId,
      int? progress,
      int? score}) async {
    final entity = await animeTrackListDao.getAnimeTrackItem(
        animeId: animeId, entryId: entryId);
    final targetUserId = (await userDataDao.getUserData())?.id;

    if (targetUserId == null) {
      /// no login, return with error.
      return LoadError(const UnauthorizedException());
    }

    if (entity != null) {
      /// the tracking anime is already cached in database.
      /// change the local database and notify the to ui without waiting network result.
      final updatedEntity = entity.copyWith(
        status: status,
        progress: progress ?? entity.progress,
        score: score ?? entity.progress,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await animeTrackListDao.insertTrackingAnimeListEntities([updatedEntity]);
      animeTrackListDao.notifyTrackingAnimeContentChanged(targetUserId);
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
      final updateEntity = AnimeTrackItemEntity.fromNetworkModel(result);
      await animeTrackListDao.insertTrackingAnimeListEntities([updateEntity]);
      animeTrackListDao.notifyTrackingAnimeContentChanged(targetUserId);
      return LoadSuccess(data: []);
    } on NetworkException catch (exception) {
      /// network error happened.
      /// revert the changes in database.
      if (entity != null) {
        await animeTrackListDao.insertTrackingAnimeListEntities([entity]);
      }
      animeTrackListDao.notifyTrackingAnimeContentChanged(targetUserId);
      return LoadError(exception);
    }
  }
}
