import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';

class ActivityPagingBloc extends RefreshPagingBloc<ActivityModel> {
  ActivityPagingBloc({
    required this.userType,
    required this.filterType,
    required this.repository,
  }) : super(const PageInit(data: []));

  final ActivityRepository repository;
  final ActivityScopeCategory userType;
  final ActivityFilterType filterType;

  @override
  Future<LoadResult<List<ActivityModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return repository.loadActivitiesByPage(
        loadType: isRefresh
            ? const Refresh(AfConfig.activityPageDefaultPerPageCount)
            : Append(
                page: page, perPage: AfConfig.activityPageDefaultPerPageCount),
        filterType: filterType,
        scopeType: userType,
        token: cancelToken);
  }
}
