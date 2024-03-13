import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_list_entity.dart';
import 'package:aniflow/core/database/model/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/model/fuzzy_date_input_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'model/media_list_status.dart';

abstract class MediaListRepository {
  ///
  Future<LoadResult<List<MediaListItemModel>>> getMediaListByPage({
    required List<MediaListStatus> status,
    required MediaType type,
    required int page,
    required int perPage,
    String? userId,
    CancelToken? token,
  });

  Stream<List<MediaListItemModel>> getMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type});

  /// Sync mediaList by [mediaType] with 50 limit.
  Future<LoadResult<void>> syncMediaList({
    String? userId,
    List<MediaListStatus> status = const [],
    MediaType? mediaType,
    CancelToken? token,
  });

  Future<LoadResult> syncMediaListItem({
    String? userId,
    required String mediaId,
    required ScoreFormat format,
    CancelToken? token,
  });

  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type});

  Stream<MediaListItemModel?> getMediaListItemByUserAndIdStream(
      {required String userId, required String animeId});

  Future<LoadResult<void>> updateMediaList({
    required String animeId,
    MediaListStatus? status,
    String? entryId,
    int? progress,
    int? progressVolumes,
    double? score,
    int? repeat,
    bool private = false,
    String? notes,
    DateTime? startedAt,
    DateTime? completedAt,
    CancelToken? cancelToken,
  });

  Stream<bool> getIsReleasedOnlyStream();

  void setIsReleasedOnly(bool isShowReleasedOnly);
}

class MediaListRepositoryImpl extends MediaListRepository {
  final MediaListDao mediaListDao = AniflowDatabase().getMediaListDao();
  final UserDataDao userDataDao = AniflowDatabase().getUserDataDao();
  final MediaDao mediaDao =
      AniflowDatabase().getMediaDao();
  final AniListDataSource aniListDataSource = AniListDataSource();
  final AuthDataSource authDataSource = AuthDataSource();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<LoadResult<List<MediaListItemModel>>> getMediaListByPage({
    required List<MediaListStatus> status,
    required MediaType type,
    required int page,
    required int perPage,
    String? userId,
    CancelToken? token,
  }) async {
    final targetUserId = userId ?? preferences.authedUserId.value;
    if (targetUserId == null) {
      /// No user.
      return LoadError(const NotFoundException());
    }

    return LoadPageUtil.loadPageWithoutDBCache(
      onGetNetworkRes: (int page, int perPage) {
        return aniListDataSource.getUserMediaListPage(
          param: UserAnimeListPageQueryParam(
              page: page,
              perPage: perPage,
              userId: int.parse(targetUserId),
              mediaType: type,
              status: status,
              format: AniFlowPreferences().aniListSettings.value.scoreFormat),
          token: token,
        );
      },
      page: page,
      perPage: perPage,
      mapDtoToModel: (dto) => MediaListItemModel.fromDto(dto),
      onInsertToDB: (dto) async {
        final entities =
            dto.map((e) => MediaEntity.fromNetworkModel(e.media!)).toList();
        await mediaDao.insertMedia(entities);
      },
    );
  }

  @override
  Future<LoadResult<void>> syncMediaList({
    String? userId,
    List<MediaListStatus> status = const [],
    MediaType? mediaType,
    CancelToken? token,
  }) async {
    try {
      final targetUserId = userId ?? preferences.authedUserId.value;
      if (targetUserId == null) {
        /// No user.
        return LoadError(Exception('no user'));
      }

      /// get all anime list items from network.
      final networkAnimeList = await aniListDataSource.getUserMediaListPage(
        param: UserAnimeListPageQueryParam.all(
          mediaType: mediaType,
          status: status,
          userId: int.parse(targetUserId.toString()),
          format: AniFlowPreferences().aniListSettings.value.scoreFormat,
        ),
        token: token,
      );

      /// insert data to db.
      final entities = networkAnimeList
          .map((e) => MediaListAndMediaRelation.fromDto(e))
          .toList();
      await mediaListDao.insertMediaListAndMediaRelations(entities);

      return LoadSuccess(data: null);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Future<LoadResult> syncMediaListItem({
    String? userId,
    required String mediaId,
    required ScoreFormat format,
    CancelToken? token,
  }) async {
    try {
      final targetUserId = userId ?? preferences.authedUserId.value;
      if (targetUserId == null) {
        /// No user.
        return LoadError(Exception('no user'));
      }

      /// get all anime list items from network.
      final networkMediaList = await aniListDataSource.getSingleMediaListItem(
        userId: targetUserId,
        mediaId: mediaId,
        format: format,
        token: token,
      );

      /// insert data to db.
      final entity = networkMediaList != null
          ? MediaListAndMediaRelation.fromDto(networkMediaList)
          : null;

      if (entity == null) {
        return LoadError(Exception('No media list'));
      }

      await mediaListDao
          .insertMediaListAndMediaRelations([entity], ConflictAlgorithm.ignore);
      return LoadSuccess(data: null);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Stream<List<MediaListItemModel>> getMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type}) {
    return mediaListDao.getMediaListStream(userId, status, type).map(
          (models) =>
              models.map((e) => MediaListItemModel.fromRelation(e)).toList(),
        );
  }

  @override
  Stream<MediaListItemModel?> getMediaListItemByUserAndIdStream(
      {required String userId, required String animeId}) {
    return mediaListDao
        .getMediaListEntityByUserAndIdStream(userId: userId, mediaId: animeId)
        .map(
          (entity) =>
              entity != null ? MediaListItemModel.fromEntity(entity) : null,
        );
  }

  @override
  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type}) {
    return mediaListDao.getMediaListMediaIdsByUserStream(userId, status, type);
  }

  @override
  Future<LoadResult<void>> updateMediaList({
    required String animeId,
    MediaListStatus? status,
    String? entryId,
    int? progress,
    int? progressVolumes,
    double? score,
    int? repeat,
    bool private = false,
    String? notes,
    DateTime? startedAt,
    DateTime? completedAt,
    CancelToken? cancelToken,
  }) async {
    final entity =
        await mediaListDao.getMediaListItem(mediaId: animeId, entryId: entryId);
    final targetUserId = preferences.authedUserId.value;

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
        score: score ?? entity.score,
        repeat: repeat ?? entity.repeat,
        notes: notes ?? entity.notes,
        startedAt: startedAt?.millisecondsSinceEpoch ?? entity.startedAt,
        completedAt: completedAt?.millisecondsSinceEpoch ?? entity.completedAt,
        private: private.toInteger() ?? entity.private,
        updatedAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      );
      await mediaListDao.insertMediaListEntities([updatedEntity]);
    }

    try {
      /// post mutation to network and insert result to database.
      final result = await authDataSource.saveMediaToMediaList(
        param: MediaListMutationParam(
          entryId: int.tryParse(entryId ?? ''),
          mediaId: int.parse(animeId),
          progress: progress,
          progressVolumes: progressVolumes,
          status: status,
          repeat: repeat,
          private: private,
          notes: notes,
          startedAt: startedAt.toFuzzyDateInput(),
          completedAt: completedAt.toFuzzyDateInput(),
          score: score,
        ),
        token: cancelToken,
      );
      final updateEntity = MediaListEntity.fromNetworkModel(result);
      await mediaListDao.insertMediaListEntities([updateEntity]);
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      /// network error happened.
      /// revert the changes in database.
      if (entity != null) {
        await mediaListDao.insertMediaListEntities([entity]);
      }
      return LoadError(exception);
    }
  }

  @override
  Stream<bool> getIsReleasedOnlyStream() =>
      preferences.isShowReleaseOnly;

  @override
  void setIsReleasedOnly(bool isShowReleasedOnly) =>
      preferences.isShowReleaseOnly.setValue(isShowReleasedOnly);
}
