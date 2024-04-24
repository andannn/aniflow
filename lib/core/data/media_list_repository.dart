import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/media_list_mapper.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:aniflow/core/database/mappers/media_list_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/model/fuzzy_date_input_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/data/aniflow_preferences_repository.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaListRepository {
  MediaListRepository(
    this.authDataSource,
    this.aniListDataSource,
    this.mediaListDao,
    this.userDataDao,
    this.mediaDao,
    this.preferences,
  );

  final MediaListDao mediaListDao;
  final UserDao userDataDao;
  final MediaDao mediaDao;
  final AniListDataSource aniListDataSource;
  final AuthDataSource authDataSource;
  final AfPreferencesRepository preferences;

  Future<LoadResult<List<MediaListItemModel>>> getMediaListByPage({
    required List<MediaListStatus> status,
    required MediaType type,
    required int page,
    required int perPage,
    String? userId,
    CancelToken? token,
  }) async {
    final targetUserId = userId ?? preferences.userData.authedUserId;
    if (targetUserId == null) {
      /// No user.
      return LoadError(const NotFoundException());
    }

    return LoadPageUtil.loadPageWithoutOrderingCache(
      onGetNetworkRes: (int page, int perPage) {
        return aniListDataSource.getUserMediaListPage(
          param: UserAnimeListPageQueryParam(
              page: page,
              perPage: perPage,
              userId: int.parse(targetUserId),
              mediaType: type,
              status: status,
              format: preferences.userData.scoreFormat),
          token: token,
        );
      },
      page: page,
      perPage: perPage,
      mapDtoToModel: (dto) => dto.toModel(),
      onInsertToDB: (dto) async {
        final entities = dto.map((e) => e.media!.toEntity()).toList();
        await mediaDao.insertOrIgnoreMedia(entities);
      },
    );
  }

  Future<LoadResult<void>> syncMediaList({
    String? userId,
    List<MediaListStatus> status = const [],
    MediaType? mediaType,
    CancelToken? token,
  }) async {
    try {
      final targetUserId = userId ?? preferences.userData.authedUserId;
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
          format: preferences.userData.scoreFormat,
        ),
        token: token,
      );

      /// insert data to db.
      final entities = networkAnimeList.map((e) => e.toRelation()).toList();
      await mediaListDao.upsertMediaListAndMediaRelations(entities);

      return LoadSuccess(data: null);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  Future<LoadResult> syncMediaListItem({
    String? userId,
    required String mediaId,
    required ScoreFormat format,
    CancelToken? token,
  }) async {
    try {
      final targetUserId = userId ?? preferences.userData.authedUserId;
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
      final entity = networkMediaList?.toRelation();

      if (entity == null) {
        return LoadError(Exception('No media list'));
      }

      await mediaListDao.upsertMediaListAndMediaRelations([entity]);
      return LoadSuccess(data: null);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  Stream<List<MediaListItemModel>> getMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type}) {
    return mediaListDao
        .getAllMediaListOfUserStream(
          userId,
          status.map((e) => e.toJson()).toList(),
          type.toJson(),
        )
        .map(
          (models) => models.map((e) => e.toModel()).toList(),
        );
  }

  Stream<MediaListItemModel?> getMediaListItemByUserAndIdStream(
      {required String userId, required String animeId}) {
    return mediaListDao.getMediaListOfUserStream(userId, animeId).map(
          (entity) => entity?.toModel(),
        );
  }

  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type}) {
    return mediaListDao
        .getAllMediaIdInMediaListStream(
          userId,
          status.map((e) => e.toJson()).toList(),
          type.toJson(),
        )
        .map((e) => e.toSet());
  }

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
    final entity = await mediaListDao.getMediaListItem(animeId);
    final targetUserId = preferences.userData.authedUserId;

    if (targetUserId == null) {
      /// no login, return with error.
      return LoadError(const UnauthorizedException());
    }

    if (entity != null) {
      /// the tracking anime is already cached in database.
      /// change the local database and notify the to ui without waiting
      /// network result.
      final updatedEntity = entity.copyWith(
        status: Value(status?.toJson()),
        progress: Value(progress ?? entity.progress),
        score: Value(score ?? entity.score),
        repeat: Value(repeat ?? entity.repeat),
        notes: Value(notes ?? entity.notes),
        startedAt: Value(startedAt?.millisecondsSinceEpoch ?? entity.startedAt),
        completedAt:
            Value(completedAt?.millisecondsSinceEpoch ?? entity.completedAt),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch ~/ 1000),
      );
      await mediaListDao.upsertMediaListEntities([updatedEntity]);
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
      final updateEntity = result.toEntity();
      await mediaListDao.upsertMediaListEntities([updateEntity]);
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      /// network error happened.
      /// revert the changes in database.
      if (entity != null) {
        await mediaListDao.upsertMediaListEntities([entity]);
      }
      return LoadError(exception);
    }
  }

  Stream<bool> getIsReleasedOnlyStream() =>
      preferences.userDataStream.map((e) => e.isShowReleaseOnly);

  void setIsReleasedOnly(bool isShowReleasedOnly) =>
      preferences.setIsShowReleaseOnly(isShowReleasedOnly);
}
