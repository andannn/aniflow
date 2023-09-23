import 'dart:async';

import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/feature/anime_track/bloc/track_ui_state.dart';
import 'package:bloc/bloc.dart';

sealed class TrackEvent {}

class TrackBloc extends Bloc<TrackEvent, TrackUiState> {
  TrackBloc(
      {required UserAnimeListRepository userAnimeListRepository,
      required AuthRepository authRepository})
      : _userAnimeListRepository = userAnimeListRepository,
        _authRepository = authRepository,
        super(TrackUiState()) {
    _init();
  }

  StreamSubscription? _userContentSub;
  final UserAnimeListRepository _userAnimeListRepository;
  final AuthRepository _authRepository;

  void _init() async {
    final userData = await _authRepository.getUserDataStream().first;
    if (userData == null) {
      /// no login user, return.
      return;
    }

    _userContentSub = _userAnimeListRepository.getUserAnimeListStream(
      status: [AnimeListStatus.current],
      userId: userData.id,
    ).listen((event) {

    });

    /// post event to sync user anime list.
    _userAnimeListRepository.syncUserAnimeList(userId: userData.id);
  }

  @override
  Future<void> close() {
    _userContentSub?.cancel();
    return super.close();
  }

  @override
  void onChange(Change<TrackUiState> change) {
    super.onChange(change);
  }
}
