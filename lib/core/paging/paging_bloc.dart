import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/feature/profile/profile_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

abstract class PagingEvent<T> {}

class _OnPageLoadedEvent<T> extends PagingEvent<T> {
  final List<T> data;
  final int page;
  final bool isRefresh;

  _OnPageLoadedEvent(this.data, this.page, this.isRefresh);
}

class _OnPageErrorEvent<T> extends PagingEvent<T> {
  final Exception exception;

  _OnPageErrorEvent(this.exception);
}

class OnInit<T> extends PagingEvent<T> {}

class OnRequestLoadPageEvent<T> extends PagingEvent<T> {}

class OnRetryLoadPageEvent<T> extends PagingEvent<T> {}

abstract class PagingBloc<T> extends Bloc<PagingEvent<T>, PagingState<List<T>>>
    with LoadingStateNotifier<PagingEvent<T>, PagingState<List<T>>> {
  PagingBloc(super.initialState) {
    on<OnInit<T>>(onInit);
    on<_OnPageLoadedEvent<T>>(_onPageLoadedEvent);
    on<_OnPageErrorEvent<T>>(_onPageErrorEvent);
    on<OnRequestLoadPageEvent<T>>(_onRequestLoadPageEvent);
    on<OnRetryLoadPageEvent<T>>(_onRetryLoadPageEvent);

    add(OnInit());
  }

  CancelToken? _cancelToken;

  @override
  bool isLoading(PagingState<List<T>> state) => state is PageLoading;

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }

  Future<void> onInit(
      OnInit<T> event, Emitter<PagingState<List<T>>> emit) async {
    emit(state.toLoading());

    /// launch event to get first page data.
    await createLoadPageTask(page: 1, isRefresh: false);
  }

  Future<LoadResult<List<T>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  });

  Future createLoadPageTask({int page = 1, bool isRefresh = false}) async {
    _cancelToken ??= CancelToken();
    final LoadResult result = await loadPage(
      page: page,
      isRefresh: isRefresh,
      cancelToken: _cancelToken,
    );
    switch (result) {
      case LoadSuccess<List<T>>(data: final data):
        add(_OnPageLoadedEvent(data, page, isRefresh));
      case LoadError<List<T>>(exception: final exception):
        if (exception is DioException &&
            exception.type == DioExceptionType.cancel) {
          logger.d('Page loading is canceled ${exception.message}');
          return;
        }

        add(_OnPageErrorEvent(exception));
      default:
    }
  }

  FutureOr<void> _onPageLoadedEvent(
      _OnPageLoadedEvent<T> event, Emitter<PagingState<List<T>>> emit) {
    final pagingState = state;
    final currentData = pagingState.data;
    final PagingState<List<T>> newPagingState;
    if (event.isRefresh) {
      newPagingState = PageReady(data: event.data, page: event.page);
    } else if (event.data.isEmpty) {
      newPagingState = pagingState.toReachEnd();
    } else {
      newPagingState =
          PageReady(data: currentData + event.data, page: event.page);
    }

    onEmitNewPagingState(newPagingState, emit);
  }

  void onEmitNewPagingState(
      PagingState<List<T>> state, Emitter<PagingState<List<T>>> emit) {
    emit(state);
  }

  FutureOr<void> _onPageErrorEvent(
      _OnPageErrorEvent<T> event, Emitter<PagingState<List<T>>> emit) {
    emit(state.toError(event.exception));
    ErrorHandler.handleException(exception: event.exception);
  }

  FutureOr<void> _onRequestLoadPageEvent(
      OnRequestLoadPageEvent<T> event, Emitter<PagingState<List<T>>> emit) {
    final pagingState = state;

    if (pagingState is PageLoading || pagingState is PageLoadReachEnd) {
      /// page is loading or already load all data.
      return null;
    }

    final currentPage = pagingState.page;

    /// change state to loading.
    emit(pagingState.toLoading());

    /// load new page.
    createLoadPageTask(page: currentPage + 1, isRefresh: false);
  }

  FutureOr<void> _onRetryLoadPageEvent(
      OnRetryLoadPageEvent<T> event, Emitter<PagingState<List<T>>> emit) {
    if (state is! PageLoadingError) {
      return null;
    }

    /// change state to loading.
    emit(state.toLoading());

    /// post task to load page.
    createLoadPageTask(page: state.page + 1, isRefresh: false);
  }
}
