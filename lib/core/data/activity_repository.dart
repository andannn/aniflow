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

abstract class ActivityRepository {
  Future<LoadResult<List<ActivityModel>>> loadActivitiesByPage(
      {required LoadType loadType,
      required ActivityFilterType filterType,
      required ActivityScopeCategory userType});
}

class ActivityRepositoryImpl implements ActivityRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final ActivityDao activityDao = AniflowDatabase().getActivityDao();

  @override
  Future<LoadResult<List<ActivityModel>>> loadActivitiesByPage(
      {required LoadType loadType,
      required ActivityFilterType filterType,
      required ActivityScopeCategory userType}) async {
    final categoryKey = (filterType, userType).combineJsonKey;
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) async {
        List<ActivityType> type;
        bool isFollowing;
        bool? hasReplies;

        switch (userType) {
          case ActivityScopeCategory.global:
            isFollowing = false;

            /// only show replied List Activity when Select global.
            if (filterType == ActivityFilterType.list) {
              hasReplies = true;
            }
          case ActivityScopeCategory.following:
            isFollowing = true;
        }

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
            hasReplies: hasReplies,
          ),
        );
      },
      onClearDbCache: () => activityDao.clearActivityEntities(categoryKey),
      onInsertEntityToDB: (entities) => activityDao.upsertActivityEntities(
          entities, categoryKey),
      onGetEntityFromDB: (page, perPage) => activityDao.getActivityEntities(
          page, perPage, categoryKey),
      mapDtoToEntity: (dto) => ActivityAndUserRelation.fromDto(dto),
      mapEntityToModel: (entity) => ActivityModel.fromEntity(entity),
    );
  }
}
