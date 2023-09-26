import 'dart:async';

import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/util/anime_list_item_model_util.dart';
import 'package:anime_tracker/feature/anime_track/bloc/track_ui_state.dart';
import 'package:anime_tracker/feature/anime_track/bloc/user_anime_list_load_state.dart';
import 'package:bloc/bloc.dart';

sealed class TrackEvent {}

class _OnUserStateChanged extends TrackEvent {
  final UserData? userData;

  _OnUserStateChanged({required this.userData});
}

class _OnLoadStateChanged extends TrackEvent {
  final bool isLoading;

  _OnLoadStateChanged({required this.isLoading});
}

class _OnWatchingAnimeListChanged extends TrackEvent {
  final List<AnimeListItemModel> animeList;

  _OnWatchingAnimeListChanged({required this.animeList});
}

class OnToggleShowFollowOnly extends TrackEvent {
  OnToggleShowFollowOnly();
}

class TrackBloc extends Bloc<TrackEvent, TrackUiState> {
  TrackBloc(
      {required AnimeTrackListRepository animeTrackListRepository,
      required AuthRepository authRepository})
      : _animeTrackListRepository = animeTrackListRepository,
        _authRepository = authRepository,
        super(TrackUiState()) {
    on<_OnUserStateChanged>(_onUserStateChanged);
    on<_OnLoadStateChanged>(_onLoadStateChanged);
    on<_OnWatchingAnimeListChanged>(_onWatchingAnimeListChanged);
    on<OnToggleShowFollowOnly>(_onToggleShowReleasedOnly);

    _init();
  }

  StreamSubscription? _userContentSub;
  StreamSubscription? _userStateSub;
  final AnimeTrackListRepository _animeTrackListRepository;
  final AuthRepository _authRepository;

  var _watchingAnimeList = <AnimeListItemModel>[];

  void _init() async {
    /// start listen user changed event.
    _userStateSub ??= _authRepository.getUserDataStream().listen((userData) {
      add(_OnUserStateChanged(userData: userData));
    });
  }

  @override
  Future<void> close() {
    _userContentSub?.cancel();
    _userStateSub?.cancel();
    return super.close();
  }

  Future syncUserAnimeList({String? userId}) async {
    add(_OnLoadStateChanged(isLoading: true));
    final result =
        await _animeTrackListRepository.syncUserAnimeList(userId: userId);
    if (result is LoadError) {
      /// load error, show snack bar msg.
    }
    add(_OnLoadStateChanged(isLoading: false));
  }

  Future<void> _onUserStateChanged(
    _OnUserStateChanged event,
    Emitter<TrackUiState> emit,
  ) async {
    if (event.userData == null) {
      emit(state.copyWith(animeLoadState: const UserAnimeNoUser()));
    } else {
      if (state.animeLoadState is UserAnimeNoUser) {
        emit(state.copyWith(animeLoadState: const UserAnimeInitState()));
      }

      /// start listening streams if needed.
      final userData = event.userData!;
      await _userContentSub?.cancel();
      _userContentSub = _animeTrackListRepository.getUserAnimeListStream(
          status: [AnimeListStatus.planning, AnimeListStatus.current],
          userId: userData.id,
        ).listen((animeList) {
          add(_OnWatchingAnimeListChanged(animeList: animeList));
        });
    }
  }

  FutureOr<void> _onLoadStateChanged(
      _OnLoadStateChanged event, Emitter<TrackUiState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  FutureOr<void> _onWatchingAnimeListChanged(
      _OnWatchingAnimeListChanged event, Emitter<TrackUiState> emit) {
    final loadState = state.animeLoadState;
    if (loadState is UserAnimeNoUser) {
      /// no login, just return.
      return null;
    }

    _watchingAnimeList = event.animeList;

    final needShowReleasedOnly = state.showReleasedOnly;

    /// trim anime list if needed.
    List<AnimeListItemModel> animeList;
    if (needShowReleasedOnly) {
      animeList =
          _watchingAnimeList.where((e) => e.hasNextReleasingEpisode).toList();
    } else {
      animeList = _watchingAnimeList;
    }

    emit(state.copyWith(
      animeLoadState: UserAnimeLoaded(watchingAnimeList: animeList),
    ));
  }

  FutureOr<void> _onToggleShowReleasedOnly(
      OnToggleShowFollowOnly event, Emitter<TrackUiState> emit) {
    final loadState = state.animeLoadState;
    if (loadState is UserAnimeNoUser || loadState is UserAnimeInitState) {
      /// no login, or not loaded, just return.
      return null;
    }

    final needShowReleasedOnly = !state.showReleasedOnly;
    emit(state.copyWith(showReleasedOnly: needShowReleasedOnly));

    /// trim anime list if needed.
    List<AnimeListItemModel> animeList;
    if (needShowReleasedOnly) {
      animeList =
          _watchingAnimeList.where((e) => e.hasNextReleasingEpisode).toList();
    } else {
      animeList = _watchingAnimeList;
    }
    emit(
      state.copyWith(
        animeLoadState: UserAnimeLoaded(watchingAnimeList: animeList),
      ),
    );
  }
}
