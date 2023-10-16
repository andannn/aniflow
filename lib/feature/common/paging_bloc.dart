import 'dart:async';

import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:bloc/bloc.dart';

abstract class PagingEvent<T> {}

class OnPageLoadedEvent<T> extends PagingEvent<T> {
  final List<T> data;
  final int page;

  OnPageLoadedEvent(this.data, this.page);
}

class OnPageErrorEvent<T> extends PagingEvent<T> {
  final Exception exception;

  OnPageErrorEvent(this.exception);
}

class OnRequestLoadPageEvent<T> extends PagingEvent<T> {}

class OnRetryLoadPageEvent<T> extends PagingEvent<T> {}

abstract class PagingBloc<T>
    extends Bloc<PagingEvent<T>, PagingState<List<T>>> {
  PagingBloc(super.initialState) {
    on<OnPageLoadedEvent<T>>(_onPageLoadedEvent);
    on<OnPageErrorEvent<T>>(_onPageErrorEvent);
    on<OnRequestLoadPageEvent<T>>(_onRequestLoadPageEvent);
    on<OnRetryLoadPageEvent<T>>(_onRetryLoadPageEvent);

    /// launch event to get first page data.
    unawaited(createLoadPageTask(page: 1));
  }

  FutureOr<void> _onPageLoadedEvent(
      OnPageLoadedEvent<T> event, Emitter<PagingState<List<T>>> emit) {
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

  FutureOr<void> _onPageErrorEvent(
      OnPageErrorEvent<T> event, Emitter<PagingState<List<T>>> emit) {
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

  Future<bool> createLoadPageTask({required int page});

  void onEmitNewPagingState(
      PagingState<List<T>> state, Emitter<PagingState<List<T>>> emit) {
    emit(state);
  }
}
