import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/refresh_paging_bloc.dart';

class ActivityPagingBloc extends RefreshPagingBloc<ActivityModel> {
  ActivityPagingBloc({
    required ActivityScopeCategory userType,
    required ActivityFilterType filterType,
    required ActivityRepository repository,
  })  : _repository = repository,
        _userType = userType,
        _filterType = filterType,
        super(const PageInit(data: []));

  final ActivityRepository _repository;
  final ActivityScopeCategory _userType;
  final ActivityFilterType _filterType;

  @override
  Future<LoadResult<List<ActivityModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _repository.loadActivitiesByPage(
        loadType: isRefresh
            ? const Refresh(Config.activityPageDefaultPerPageCount)
            : Append(
                page: page, perPage: Config.activityPageDefaultPerPageCount),
        filterType: _filterType,
        scopeType: _userType);
  }
}
