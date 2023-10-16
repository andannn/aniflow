import 'dart:async';

import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/ani_list_repository.dart';
import 'package:anime_tracker/core/data/auth_repository.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:bloc/bloc.dart';

sealed class AnimeListEvent {}

class _OnAnimePageLoadedEvent extends AnimeListEvent {
  final List<AnimeModel> data;
  final int page;

  _OnAnimePageLoadedEvent(this.data, this.page);
}

class _OnAnimePageErrorEvent extends AnimeListEvent {
  final Exception exception;

  _OnAnimePageErrorEvent(this.exception);
}

class OnRequestLoadPageEvent extends AnimeListEvent {}

class OnRetryLoadPageEvent extends AnimeListEvent {}

class _OnTrackingAnimeIdsChanged extends AnimeListEvent {
  final Set<String> ids;

  _OnTrackingAnimeIdsChanged({required this.ids});
}

extension on PagingState<List<AnimeModel>> {
  PagingState<List<AnimeModel>> copyWithTrackedIds(Set<String> ids) {
    return updateWith(
      (animeList) => animeList
          .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
          .toList(),
    );
  }
}

class AnimeListBloc
    extends Bloc<AnimeListEvent, PagingState<List<AnimeModel>>> {
  AnimeListBloc({
    required this.category,
    required AuthRepository authRepository,
    required MediaInformationRepository aniListRepository,
    required AniListRepository animeTrackListRepository,
  })  : _mediaInfoRepository = aniListRepository,
        _authRepository = authRepository,
        _animeTrackListRepository = animeTrackListRepository,
        super(const PageLoading(data: [], page: 1)) {
    on<_OnAnimePageLoadedEvent>(_onAnimePageLoadedEvent);
    on<_OnAnimePageErrorEvent>(_onAnimePageErrorEvent);
    on<_OnTrackingAnimeIdsChanged>(_onTrackingAnimeIdsChanged);
    on<OnRequestLoadPageEvent>(_onRequestLoadPageEvent);
    on<OnRetryLoadPageEvent>(_onRetryLoadPageEvent);

    _init();
  }

  final AnimeCategory category;
  final MediaInformationRepository _mediaInfoRepository;
  final AniListRepository _animeTrackListRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _trackingIdsStream;
  Set<String> _ids = {};

  void _init() async {
    final userData = await _authRepository.getUserDataStream().first;
    if (userData != null) {
      _trackingIdsStream =
          _animeTrackListRepository.getAnimeListAnimeIdsByUserStream(
        userData.id,
        [AnimeListStatus.planning, AnimeListStatus.current],
      ).listen((ids) {
        add(_OnTrackingAnimeIdsChanged(ids: ids));
      });
    }

    /// launch event to get first page data.
    unawaited(_createLoadAnimePageTask(page: 1));
  }

  @override
  Future<void> close() {
    _trackingIdsStream?.cancel();

    return super.close();
  }

  FutureOr<void> _onRequestLoadPageEvent(OnRequestLoadPageEvent event,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    final pagingState = state;

    if (pagingState is PageLoading || pagingState is PageLoadReachEnd) {
      /// page is loading or already load all data.
      return null;
    }

    final currentPage = pagingState.page;

    /// change state to loading.
    emit(pagingState.toLoading());

    /// load new page.
    _createLoadAnimePageTask(page: currentPage + 1);
  }

  Future<bool> _createLoadAnimePageTask({required int page}) async {
    final LoadResult result =
        await _mediaInfoRepository.loadAnimePageByCategory(
      category: category,
      loadType: Append(page: page, perPage: Config.defaultPerPageCount),
    );
    switch (result) {
      case LoadSuccess<List<AnimeModel>>(data: final data):
        add(_OnAnimePageLoadedEvent(data, page));
        return true;
      case LoadError<List<AnimeModel>>(exception: final exception):
        add(_OnAnimePageErrorEvent(exception));
        return false;
      default:
        return false;
    }
  }

  FutureOr<void> _onAnimePageLoadedEvent(_OnAnimePageLoadedEvent event,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    final pagingState = state;
    final currentData = pagingState.data;
    final PagingState<List<AnimeModel>> newPagingState;
    if (event.data.isEmpty) {
      newPagingState = pagingState.toReachEnd();
    } else {
      newPagingState =
          PageReady(data: currentData + event.data, page: event.page);
    }
    emit(newPagingState.copyWithTrackedIds(_ids));
  }

  FutureOr<void> _onAnimePageErrorEvent(_OnAnimePageErrorEvent event,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    final pagingState = state;
    emit(pagingState.toError(event.exception));
  }

  FutureOr<void> _onRetryLoadPageEvent(
      OnRetryLoadPageEvent event, Emitter<PagingState<List<AnimeModel>>> emit) {
    if (state is! PageLoadingError) {
      return null;
    }

    /// change state to loading.
    emit(state.toLoading());

    /// post task to load anime.
    _createLoadAnimePageTask(page: state.page + 1);
  }

  FutureOr<void> _onTrackingAnimeIdsChanged(_OnTrackingAnimeIdsChanged event,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    _ids = event.ids;
    emit(state.copyWithTrackedIds(event.ids));
  }
}
