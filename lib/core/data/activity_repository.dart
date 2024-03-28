import 'dart:async';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/activity_type.dart';
import 'package:aniflow/core/common/definitions/extension/activity_type_extension.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/network_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/activity_mapper.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/mappers/activity_mapper.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/likeable_type.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

class ActivityStatus extends Equatable {
  final int replyCount;
  final int likeCount;
  final bool isLiked;

  const ActivityStatus(
      {required this.replyCount,
      required this.likeCount,
      required this.isLiked});

  @override
  List<Object?> get props => [replyCount, likeCount, isLiked];
}

@lazySingleton
class ActivityRepository {
  ActivityRepository(this.activityDao, this.aniListDataSource);

  final AniListDataSource aniListDataSource;
  final ActivityDao activityDao;
  final AniFlowPreferences preferences = AniFlowPreferences();

  Future<LoadResult<List<ActivityModel>>> loadActivitiesByPage({
    required LoadType loadType,
    required ActivityFilterType filterType,
    required ActivityScopeCategory scopeType,
    CancelToken? token,
  }) async {
    final categoryKey = (filterType, scopeType).combineJsonKey;
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) async {
        List<ActivityType> type;
        bool isFollowing = scopeType == ActivityScopeCategory.following;
        bool hasRepliesOrTypeText = scopeType == ActivityScopeCategory.global;

        switch (filterType) {
          case ActivityFilterType.all:
            type = [
              ActivityType.text,
              ActivityType.animeList,
              ActivityType.mangaList
            ];
          case ActivityFilterType.text:
            type = [
              ActivityType.text,
            ];
          case ActivityFilterType.list:
            type = [
              ActivityType.animeList,
              ActivityType.mangaList,
            ];
        }

        return aniListDataSource.getActivities(
          page: page,
          perPage: perPage,
          param: ActivityPageQueryParam(
            isFollowing: isFollowing,
            type: type,
            hasRepliesOrTypeText: hasRepliesOrTypeText,
          ),
          token: token,
        );
      },
      onClearDbCache: () => activityDao.clearActivityEntities(categoryKey),
      onInsertEntityToDB: (entities) =>
          activityDao.upsertActivityEntitiesWithCategory(entities, categoryKey),
      onGetEntityFromDB: (page, perPage) =>
          activityDao.getActivityEntitiesByPage(categoryKey, page, perPage),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult<List<ActivityModel>>> loadUserActivitiesByPage({
    required int page,
    required int perPage,
    required String userId,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPageWithoutOrderingCache<AniActivity,
        ActivityModel>(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) {
        return aniListDataSource.getActivities(
          page: page,
          perPage: perPage,
          param: ActivityPageQueryParam(
            userId: int.parse(userId),
            type: [
              ActivityType.mangaList,
              ActivityType.animeList,
              ActivityType.text,
            ],
          ),
          token: token,
        );
      },
      onInsertToDB: (List<AniActivity> dto) async {
        final entities = dto.map((e) => e.toEntity()).toList();
        await activityDao.upsertActivityEntities(entities);
      },
      mapDtoToModel: (dto) => dto.toModel(),
    );
  }

  Stream<(ActivityFilterType, ActivityScopeCategory)> getActivityTypeStream() {
    return CombineLatestStream.combine2(
      preferences.activityFilterType,
      preferences.activityScopeCategory,
      (filter, scope) => (filter, scope),
    );
  }

  Future setActivityFilterType(ActivityFilterType type) =>
      preferences.activityFilterType.setValue(type);

  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) =>
      preferences.activityScopeCategory.setValue(scopeCategory);

  Stream<ActivityStatus?> getActivityStatusStream(String id) =>
      activityDao.getActivityStatusStream(id).map(
            (entity) => entity == null
                ? null
                : ActivityStatus(
                    likeCount: entity.$1,
                    replyCount: entity.$2,
                    isLiked: entity.$3,
                  ),
          );

  Future<LoadResult> toggleActivityLike(String id, CancelToken token) async {
    final activityStatus = await activityDao.getActivityStatus(id);

    if (activityStatus == null) {
      return LoadError(Exception('Invalid id'));
    }

    return NetworkUtil.postMutationAndRevertWhenException(
      initialModel: activityStatus,
      onModifyModel: (status) {
        final likeCount = activityStatus.$1;
        final replyCount = activityStatus.$2;
        final newLike = !activityStatus.$3;
        return (
          newLike
              ? (likeCount + 1).clamp(0, 9999)
              : (likeCount - 1).clamp(0, 9999),
          replyCount,
          newLike,
        );
      },
      onSaveLocal: (status) => activityDao.updateActivityStatus(id, status),
      onSyncWithRemote: (status) async {
        await aniListDataSource.toggleSocialContentLike(
          id,
          LikeableType.activity,
          token,
        );
        return null;
      },
    );
  }

  Future<LoadResult<List<ActivityReplyModel>>> getActivityReplies(
      String activityId,
      [CancelToken? token]) async {
    try {
      final activity =
          await aniListDataSource.getActivityDetail(activityId, token);

      final activityModel = activity.toModel();
      return LoadSuccess(data: activityModel.replies);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  Future<ActivityModel> getActivityModel(String activityId) async {
    final entity = await activityDao.getActivity(activityId);
    return entity.toModel();
  }
}
