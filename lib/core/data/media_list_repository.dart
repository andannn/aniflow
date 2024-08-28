import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/media_list_mapper.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/mappers/media_list_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/util/date_time_util.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.impl])
class MediaListRepository {
  MediaListRepository(
    this._authDataSource,
    this._aniListDataSource,
    this._mediaListDao,
    this._mediaDao,
    this._preferences,
  );

  final MediaListDao _mediaListDao;
  final MediaDao _mediaDao;
  final AniListDataSource _aniListDataSource;
  final AuthDataSource _authDataSource;
  final UserDataPreferences _preferences;

  Future<LoadResult<List<MediaWithListModel>>> getMediaListByPage({
    required List<MediaListStatus> status,
    required MediaType type,
    required int page,
    required int perPage,
    String? userId,
    CancelToken? token,
  }) async {
    final targetUserId = userId ?? _preferences.userData.authedUserId;
    if (targetUserId == null) {
      /// No user.
      return LoadError(const NotFoundException());
    }

    return LoadPageUtil.loadPageWithoutOrderingCache(
      onGetNetworkRes: (int page, int perPage) {
        return _aniListDataSource.getUserMediaListPage(
          param: UserAnimeListPageQueryParam(
              page: page,
              perPage: perPage,
              userId: int.parse(targetUserId),
              mediaType: type,
              status: status,
              format: _preferences.userData.scoreFormat),
          token: token,
        );
      },
      page: page,
      perPage: perPage,
      mapDtoToModel: (dto) => dto.toModel(),
      onInsertToDB: (dto) async {
        final entities = dto.map((e) => e.media!.toEntity()).toList();
        await _mediaDao.insertOrIgnoreMedia(entities);
      },
    );
  }

  Future<LoadResult<void>> syncMediaList({
    String? userId,
    List<MediaListStatus> status = const [],
    int page = -1,
    MediaType? mediaType,
    CancelToken? token,
  }) async {
    try {
      final targetUserId = userId ?? _preferences.userData.authedUserId;
      if (targetUserId == null) {
        /// No user.
        return LoadError(Exception('no user'));
      }

      /// get all anime list items from network.
      final networkAnimeList = await _aniListDataSource.getUserMediaListPage(
        param: page == -1
            ? UserAnimeListPageQueryParam.all(
                mediaType: mediaType,
                status: status,
                userId: int.parse(targetUserId.toString()),
                format: _preferences.userData.scoreFormat,
              )
            : UserAnimeListPageQueryParam(
                page: page,
                mediaType: mediaType,
                status: status,
                userId: int.parse(targetUserId.toString()),
                format: _preferences.userData.scoreFormat,
              ),
        token: token,
      );

      /// insert data to db.
      final entities = networkAnimeList.map((e) => e.toRelation()).toList();
      await _mediaListDao.upsertMediaListAndMediaRelations(entities);

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
      final targetUserId = userId ?? _preferences.userData.authedUserId;
      if (targetUserId == null) {
        /// No user.
        return LoadError(Exception('no user'));
      }

      /// get all anime list items from network.
      final networkMediaList = await _aniListDataSource.getSingleMediaListItem(
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

      await _mediaListDao.upsertMediaListAndMediaRelations([entity]);
      return LoadSuccess(data: null);
    } on DioException catch (e) {
// TODO: Convert to app defined Exception.
      if (e.response?.data?['data']?['MediaList'] == null) {
        return LoadSuccess(data: null);
      }
      return LoadError(e);
    }
  }

  Stream<SortedGroupMediaListModel> getSortedMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type}) {
    return _mediaListDao
        .getAllSortedMediaListOfUserStream(
          userId,
          status.map((e) => e.toJson()).toList(),
          type.toJson(),
        )
        .map(
          (sorted) => SortedGroupMediaListModel(
            sorted.newUpdateList.map((e) => e.toModel()).toList(),
            sorted.otherList.map((e) => e.toModel()).toList(),
          ),
        );
  }

  Stream<List<MediaWithListModel>> getMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type}) {
    return _mediaListDao
        .getMediaListStream(
          userId,
          status.map((e) => e.toJson()).toList(),
          type.toJson(),
        )
        .map(
          (list) => list.map((entity) => entity.toModel()).toList(),
        );
  }

  Stream<MediaListItemModel?> getMediaListItemByUserAndIdStream(
      {required String userId, required String animeId}) {
    return _mediaListDao.getMediaListOfUserStream(userId, animeId).map(
          (entity) => entity?.mediaListEntity?.toModel(),
        );
  }

  Future<MediaWithListModel?> getMediaListItemByMediaId(
      {required String mediaId, String? userId}) {
    userId ??= _preferences.userData.authedUserId;
    if (userId == null) {
      return Future.value(null);
    }

    return _mediaListDao.getMediaListItemByMediaId(mediaId, userId).then(
          (entity) => entity?.toModel(),
        );
  }

  Stream<Set<String>> getMediaIdsInMediaListStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type}) {
    return _mediaListDao
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
    final userId = _preferences.userData.authedUserId;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    final entity = await _mediaListDao.getMediaListItem(animeId, userId);
    final targetUserId = _preferences.userData.authedUserId;

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
      await _mediaListDao.upsertMediaListEntities([updatedEntity]);
    }

    try {
      /// post mutation to network and insert result to database.
      final result = await _authDataSource.saveMediaToMediaList(
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
      await _mediaListDao.upsertMediaListEntities([updateEntity]);
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      /// network error happened.
      /// revert the changes in database.
      if (entity != null) {
        await _mediaListDao.upsertMediaListEntities([entity]);
      }
      return LoadError(exception);
    }
  }

  Stream<TrackListFilter> getTrackListFilterStream() =>
      _preferences.userDataStream.map((e) => e.trackListFilter);

  void setTrackListFilter(TrackListFilter trackListFilter) =>
      _preferences.setTrackListFilter(trackListFilter);
}
