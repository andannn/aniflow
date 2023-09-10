import 'dart:async';

import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../core/data/logger/logger.dart';
import '../../../core/data/model/shortcut_anime_model.dart';
import 'anime_list_state.dart';

sealed class AnimeListEvent {}

class _OnAnimePageLoadedEvent extends AnimeListEvent {
  final List<ShortcutAnimeModel> data;
  final int page;

  _OnAnimePageLoadedEvent(this.data, this.page);
}

class _OnAnimePageErrorEvent extends AnimeListEvent {
  final Exception exception;

  _OnAnimePageErrorEvent(this.exception);
}

class OnRequestLoadPageEvent extends AnimeListEvent {}

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  AnimeListBloc(
      {required this.category, required AniListRepository aniListRepository})
      : _aniListRepository = aniListRepository,
        super(AnimeListState()) {
    on<_OnAnimePageLoadedEvent>(_onAnimePageLoadedEvent);
    on<_OnAnimePageErrorEvent>(_onAnimePageErrorEvent);
    on<OnRequestLoadPageEvent>(_onRequestLoadPageEvent);

    _init();
  }

  final AnimeCategory category;
  final AniListRepository _aniListRepository;

  @override
  void onChange(Change<AnimeListState> change) {
    super.onChange(change);
    logger.d('print ${change.nextState.animePagingState.runtimeType} ${change.nextState.animePagingState.page} ${change.nextState.animePagingState.data.length}');
  }

  void _init() async {
    /// launch event to get first page data.
    _createLoadAnimePageTask(page: 1);
  }

  FutureOr<void> _onRequestLoadPageEvent(
      OnRequestLoadPageEvent event, Emitter<AnimeListState> emit) {
    final pagingState = state.animePagingState;

    if (pagingState is PageLoading || pagingState is PageLoadReachEnd) {
      /// page is loading or already load all data.
      return null;
    }

    final currentPage = pagingState.page;
    final currentData = pagingState.data;

    /// change state to loading.
    emit(
      state.copyWith(
        animePagingState: PageLoading(data: currentData, page: currentPage),
      ),
    );
    logger.d('JQN request load anime data');

    /// load new page.
    _createLoadAnimePageTask(page: currentPage + 1);
  }

  Future<bool> _createLoadAnimePageTask({required int page}) async {
    final LoadResult result = await _aniListRepository.getAnimePageByCategory(
        category: category, page: page, perPage: 9);
    switch (result) {
      case LoadSuccess<ShortcutAnimeModel>(data: final data):
        add(_OnAnimePageLoadedEvent(data, result.page));
        return true;
      case LoadError<ShortcutAnimeModel>(exception: final exception):
        add(_OnAnimePageErrorEvent(exception));
        return false;
      default:
        return false;
    }
  }

  FutureOr<void> _onAnimePageLoadedEvent(
      _OnAnimePageLoadedEvent event, Emitter<AnimeListState> emit) {
    final pagingState = state.animePagingState;
    final currentData = pagingState.data;
    final PagingState<List<ShortcutAnimeModel>> newPagingState;
    if (event.data.isEmpty) {
      newPagingState = PageLoadReachEnd(
          data: currentData, page: event.page);
    } else {
      newPagingState =
          PageReady(data: currentData + event.data, page: event.page);
    }
    emit(state.copyWith(animePagingState: newPagingState));
  }

  FutureOr<void> _onAnimePageErrorEvent(
      _OnAnimePageErrorEvent event, Emitter<AnimeListState> emit) {}
}
