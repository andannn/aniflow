import 'dart:async';

import 'package:anime_tracker/core/data/logger/logger.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
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

class TrackBloc extends Bloc<TrackEvent, TrackUiState> {
  TrackBloc(
      {required UserAnimeListRepository userAnimeListRepository,
      required AuthRepository authRepository})
      : _userAnimeListRepository = userAnimeListRepository,
        _authRepository = authRepository,
        super(TrackUiState()) {
    on<_OnUserStateChanged>(_onUserStateChanged);
    on<_OnLoadStateChanged>(_onLoadStateChanged);
    on<_OnWatchingAnimeListChanged>(_onWatchingAnimeListChanged);

    _init();
  }

  StreamSubscription? _userContentSub;
  StreamSubscription? _userStateSub;
  final UserAnimeListRepository _userAnimeListRepository;
  final AuthRepository _authRepository;

  void _init() async {
    final userData = await _authRepository.getUserDataStream().first;
    if (userData == null) {
      /// no login user, return.
      add(_OnUserStateChanged(userData: null));
      return;
    }

    _userContentSub = _userAnimeListRepository.getUserAnimeListStream(
      status: [AnimeListStatus.planning, AnimeListStatus.current],
      userId: userData.id,
    ).listen((animeList) {
      logger.d('JQN stream data $animeList');

      add(_OnWatchingAnimeListChanged(animeList: animeList));
    });

    _userStateSub = _authRepository.getUserDataStream().listen((userData) {
      add(_OnUserStateChanged(userData: userData));
    });
  }

  @override
  Future<void> close() {
    _userContentSub?.cancel();
    _userStateSub?.cancel();
    return super.close();
  }

  @override
  void onChange(Change<TrackUiState> change) {
    super.onChange(change);
    logger.d('JQN ${change.nextState.animeLoadState.runtimeType}');
  }

  Future _syncUserAnimeList({required String userId}) async {
    add(_OnLoadStateChanged(isLoading: true));
    final result =
        await _userAnimeListRepository.syncUserAnimeList(userId: userId);
    if (result is LoadError) {
      /// load error, show snack bar msg.
    }
    add(_OnLoadStateChanged(isLoading: false));
  }

  FutureOr<void> _onUserStateChanged(
      _OnUserStateChanged event,
      Emitter<TrackUiState> emit,
      ) {
    if (event.userData == null) {
      emit(state.copyWith(animeLoadState: const UserAnimeNoUser()));
    } else {
      /// post event to sync user anime list.
      _syncUserAnimeList(userId: event.userData!.id);
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

    emit(state.copyWith(
      animeLoadState: UserAnimeLoaded(watchingAnimeList: event.animeList),
    ));
  }
}
