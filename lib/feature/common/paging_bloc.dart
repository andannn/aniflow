import 'dart:async';

import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:bloc/bloc.dart';

abstract class PagingEvent<T> {}

class _OnPageLoadedEvent<T> extends PagingEvent<T> {
  final List<T> data;
  final int page;

  _OnPageLoadedEvent(this.data, this.page);
}

class _OnPageErrorEvent<T> extends PagingEvent<T> {
  final Exception exception;

  _OnPageErrorEvent(this.exception);
}

class OnInit<T> extends PagingEvent<T> {}

class OnRequestLoadPageEvent<T> extends PagingEvent<T> {}

class OnRetryLoadPageEvent<T> extends PagingEvent<T> {}

abstract class PagingBloc<T>
    extends Bloc<PagingEvent<T>, PagingState<List<T>>> {
  PagingBloc(super.initialState) {
    on<OnInit<T>>(onInit);
    on<_OnPageLoadedEvent<T>>(_onPageLoadedEvent);
    on<_OnPageErrorEvent<T>>(_onPageErrorEvent);
    on<OnRequestLoadPageEvent<T>>(_onRequestLoadPageEvent);
    on<OnRetryLoadPageEvent<T>>(_onRetryLoadPageEvent);

    add(OnInit());
  }

  FutureOr<void> onInit(OnInit<T> event, Emitter<PagingState<List<T>>> emit);

  Future<LoadResult<List<T>>> loadPage({required int page});

  Future<bool> createLoadPageTask({required int page}) async {
    final LoadResult result = await loadPage(page: page);
    switch (result) {
      case LoadSuccess<List<T>>(data: final data):
        add(_OnPageLoadedEvent(data, page));
        return true;
      case LoadError<List<T>>(exception: final exception):
        add(_OnPageErrorEvent(exception));
        return false;
      default:
        return false;
    }
  }

  FutureOr<void> _onPageLoadedEvent(
      _OnPageLoadedEvent<T> event, Emitter<PagingState<List<T>>> emit) {
    final pagingState = state;
    final currentData = pagingState.data;
    final PagingState<List<T>> newPagingState;
    if (event.data.isEmpty) {
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
    createLoadPageTask(page: currentPage + 1);
  }

  FutureOr<void> _onRetryLoadPageEvent(
      OnRetryLoadPageEvent<T> event, Emitter<PagingState<List<T>>> emit) {
    if (state is! PageLoadingError) {
      return null;
    }

    /// change state to loading.
    emit(state.toLoading());

    /// post task to load page.
    createLoadPageTask(page: state.page + 1);
  }
}
