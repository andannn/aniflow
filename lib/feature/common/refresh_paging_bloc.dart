import 'dart:async';

import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RefreshPagingBloc<T> extends PagingBloc<T> {
  RefreshPagingBloc(super.initialState);

  @override
  Future<void> onInit(OnInit<T> event,
      Emitter<PagingState<List<T>>> emit) async {
    /// launch event to get first page data.
    await createLoadPageTask(page: 1, isRefresh: false);

    await Future.delayed(const Duration(milliseconds: 5));
    emit(state.toLoading());

    /// Refresh data when init.
    /// Favorite data may be changed when change like state in detail screen.
    await createLoadPageTask(page: 1, isRefresh: true);
  }
}
