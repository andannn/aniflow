import 'dart:async';

import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/model/activity_type.dart';
import 'package:aniflow/core/common/model/extension/activity_type_extension.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/model/relations/activity_and_user_relation.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/model/likeable_type.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
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

abstract class ActivityRepository {
  Future<LoadResult<List<ActivityModel>>> loadActivitiesByPage({
    required LoadType loadType,
    required ActivityFilterType filterType,
    required ActivityScopeCategory scopeType,
    CancelToken? token,
  });

  Future setActivityFilterType(ActivityFilterType type);

  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory);

  Stream<(ActivityFilterType, ActivityScopeCategory)> getActivityTypeStream();

  Stream<ActivityStatus?> getActivityStatusStream(String id);

  Future<LoadResult> toggleActivityLike(String id, CancelToken token);
}

class ActivityRepositoryImpl implements ActivityRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final ActivityDao activityDao = AniflowDatabase().getActivityDao();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
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
          activityDao.upsertActivityEntities(entities, categoryKey),
      onGetEntityFromDB: (page, perPage) =>
          activityDao.getActivityEntities(page, perPage, categoryKey),
      mapDtoToEntity: (dto) => ActivityAndUserRelation.fromDto(dto),
      mapEntityToModel: (entity) => ActivityModel.fromEntity(entity),
    );
  }

  @override
  Stream<(ActivityFilterType, ActivityScopeCategory)> getActivityTypeStream() {
    return CombineLatestStream.combine2(
      preferences.getActivityFilterTypeStream(),
      preferences.getActivityScopeCategoryStream(),
      (filter, scope) => (filter, scope),
    );
  }

  @override
  Future setActivityFilterType(ActivityFilterType type) =>
      preferences.setActivityFilterType(type);

  @override
  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) =>
      preferences.setActivityScopeCategory(scopeCategory);

  @override
  Stream<ActivityStatus?> getActivityStatusStream(String id) =>
      activityDao.getActivityStream(id).map(
            (entity) => entity == null
                ? null
                : ActivityStatus(
                    likeCount: entity.likeCount,
                    replyCount: entity.replyCount,
                    isLiked: entity.isLiked,
                  ),
          );

  @override
  Future<LoadResult> toggleActivityLike(String id, CancelToken token) async {
    final activityStatus = await activityDao.getActivityStatus(id);

    if (activityStatus == null) {
      return LoadError(Exception('Invalid id'));
    }

    final isLike = activityStatus.isLiked;
    try {
      final newStatus = activityStatus.copyWith(isLiked: !isLike);
      await activityDao.updateActivityStatus(id, newStatus);

      await aniListDataSource.toggleSocialContentLike(
          id, LikeableType.activity, token);
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      await activityDao.updateActivityStatus(id, activityStatus);
      return LoadError(exception);
    }
  }
}
