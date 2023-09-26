import 'dart:async';

import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_ui_state.dart';

sealed class DetailAnimeEvent {}

class _OnDetailAnimeModelChangedEvent extends DetailAnimeEvent {
  _OnDetailAnimeModelChangedEvent({required this.model});

  final AnimeModel model;
}

class _OnTrackingStateChanged extends DetailAnimeEvent {
  _OnTrackingStateChanged({required this.isTracking});

  final bool isTracking;
}

class OnToggleFollowState extends DetailAnimeEvent {
  OnToggleFollowState({required this.isFollow});

  final bool isFollow;
}

class DetailAnimeBloc extends Bloc<DetailAnimeEvent, DetailAnimeUiState> {
  DetailAnimeBloc({
    required String animeId,
    required AniListRepository aniListRepository,
    required AuthRepository authRepository,
    required AnimeTrackListRepository animeTrackListRepository,
  })
      : _animeId = animeId,
        _aniListRepository = aniListRepository,
        _animeTrackListRepository = animeTrackListRepository,
        _authRepository = authRepository,
        super(DetailAnimeUiState()) {
    on<_OnDetailAnimeModelChangedEvent>(_onDetailAnimeModelChangedEvent);
    on<_OnTrackingStateChanged>(_onTrackingStateChanged);
    on<OnToggleFollowState>(_onToggleFollowState);

    _init();
  }

  final String _animeId;
  final AniListRepository _aniListRepository;
  final AnimeTrackListRepository _animeTrackListRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _detailAnimeSub;
  StreamSubscription? _isTrackingSub;
  bool _isTracking = false;

  void _init() async {
    _detailAnimeSub =
        _aniListRepository.getDetailAnimeInfoStream(_animeId).listen(
              (animeModel) {
            add(_OnDetailAnimeModelChangedEvent(model: animeModel));
          },
        );

    final userData = await _authRepository
        .getUserDataStream()
        .first;
    if (userData != null) {
      _isTrackingSub = _animeTrackListRepository
          .getIsTrackingByUserAndIdStream(
          userId: userData.id, animeId: _animeId)
          .listen(
            (isTracking) {
          add(_OnTrackingStateChanged(isTracking: isTracking));
        },
      );
    }

    /// start fetch detail anime info.
    /// detail info stream will emit new value when data ready.
    unawaited(_aniListRepository.startFetchDetailAnimeInfo(_animeId));
  }

  @override
  Future<void> close() {
    _detailAnimeSub?.cancel();
    _isTrackingSub?.cancel();

    return super.close();
  }

  @override
  void onChange(Change<DetailAnimeUiState> change) {
    super.onChange(change);
  }

  FutureOr<void> _onDetailAnimeModelChangedEvent(
      _OnDetailAnimeModelChangedEvent event,
      Emitter<DetailAnimeUiState> emit,) {
    emit(state.copyWith(detailAnimeModel: event.model));

    emit(
      state.copyWith(
        detailAnimeModel: event.model.copyWith(isFollowing: _isTracking),
      ),
    );
  }

  FutureOr<void> _onTrackingStateChanged(_OnTrackingStateChanged event,
      Emitter<DetailAnimeUiState> emit) {
    _isTracking = event.isTracking;
    emit(
      state.copyWith(
        detailAnimeModel:
        state.detailAnimeModel?.copyWith(isFollowing: event.isTracking),
      ),
    );
  }

  FutureOr<void> _onToggleFollowState(OnToggleFollowState event,
      Emitter<DetailAnimeUiState> emit) {
    final status = event.isFollow ? AnimeListStatus.current : AnimeListStatus
        .dropped;
    _animeTrackListRepository.updateAnimeInTrackList(
        animeId: _animeId, status: status);
  }
}
