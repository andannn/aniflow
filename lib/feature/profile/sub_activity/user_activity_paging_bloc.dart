import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';

import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserActivityPagingBloc extends PagingBloc<ActivityModel> {
  UserActivityPagingBloc(
    @factoryParam this.userId,
    this._activityRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final ActivityRepository _activityRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<ActivityModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _activityRepository.loadUserActivitiesByPage(
      userId: userId,
      page: page,
      perPage: perPageCount,
      token: cancelToken,
    );
  }
}
