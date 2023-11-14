import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:dio/dio.dart';

class NotificationPagingBloc extends PagingBloc<NotificationModel> {
  NotificationPagingBloc({
    required NotificationRepository repository,
    required NotificationCategory category,
  })  : _repository = repository,
        _category = category,
        super(const PageInit(data: []));

  final NotificationRepository _repository;
  final NotificationCategory _category;

  @override
  Future<LoadResult<List<NotificationModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _repository.loadNotificationsByPage(
      page: page,
      perPage: Config.notificationPageDefaultPerPageCount,
      category: _category,
      token: cancelToken,
    );
  }
}
