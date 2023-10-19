import 'dart:async';

import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/core/common/util/logger.dart';
import 'package:anime_tracker/core/data/auth_repository.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/media_list_repository.dart';
import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:anime_tracker/core/design_system/widget/aniflow_snackbar.dart';
import 'package:anime_tracker/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:bloc/bloc.dart';

sealed class DetailAnimeEvent {}

class _OnDetailAnimeModelChangedEvent extends DetailAnimeEvent {
  _OnDetailAnimeModelChangedEvent({required this.model});

  final MediaModel model;
}

class _OnTrackingStateChanged extends DetailAnimeEvent {
  _OnTrackingStateChanged({required this.isTracking});

  final bool isTracking;
}

class OnToggleFollowState extends DetailAnimeEvent {
  OnToggleFollowState({required this.isFollow});

  final bool isFollow;
}

class _OnLoadingStateChanged extends DetailAnimeEvent {
  _OnLoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

class DetailAnimeBloc extends Bloc<DetailAnimeEvent, DetailMediaUiState> {
  DetailAnimeBloc({
    required this.animeId,
    required MediaInformationRepository aniListRepository,
    required AuthRepository authRepository,
    required MediaListRepository animeTrackListRepository,
  })  : _aniListRepository = aniListRepository,
        _animeTrackListRepository = animeTrackListRepository,
        _authRepository = authRepository,
        super(DetailMediaUiState()) {
    on<_OnDetailAnimeModelChangedEvent>(_onDetailAnimeModelChangedEvent);
    on<_OnTrackingStateChanged>(_onTrackingStateChanged);
    on<OnToggleFollowState>(_onToggleFollowState);
    on<_OnLoadingStateChanged>(_onLoadingStateChanged);

    _init();
  }

  final String animeId;
  final MediaInformationRepository _aniListRepository;
  final MediaListRepository _animeTrackListRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _detailAnimeSub;
  StreamSubscription? _isTrackingSub;
  bool _isTracking = false;

  void _init() async {
    _detailAnimeSub =
        _aniListRepository.getDetailAnimeInfoStream(animeId).listen(
      (animeModel) {
        add(_OnDetailAnimeModelChangedEvent(model: animeModel));
      },
    );

    final userData = await _authRepository.getUserDataStream().first;
    if (userData != null) {
      _isTrackingSub = _animeTrackListRepository
          .getIsTrackingByUserAndIdStream(
              userId: userData.id, animeId: animeId)
          .listen(
        (isTracking) {
          add(_OnTrackingStateChanged(isTracking: isTracking));
        },
      );
    }

    /// start fetch detail anime info.
    /// detail info stream will emit new value when data ready.
    _startFetchDetailAnimeInfo();
  }

  @override
  Future<void> close() {
    _detailAnimeSub?.cancel();
    _isTrackingSub?.cancel();

    return super.close();
  }

  @override
  void onChange(Change<DetailMediaUiState> change) {
    super.onChange(change);
  }

  void _startFetchDetailAnimeInfo() async {
    add(_OnLoadingStateChanged(isLoading: true));
    await _aniListRepository.startFetchDetailAnimeInfo(animeId);
    add(_OnLoadingStateChanged(isLoading: false));
  }

  FutureOr<void> _onDetailAnimeModelChangedEvent(
    _OnDetailAnimeModelChangedEvent event,
    Emitter<DetailMediaUiState> emit,
  ) {
    emit(state.copyWith(detailAnimeModel: event.model));

    emit(
      state.copyWith(
        detailAnimeModel: event.model.copyWith(isFollowing: _isTracking),
      ),
    );
  }

  FutureOr<void> _onTrackingStateChanged(
      _OnTrackingStateChanged event, Emitter<DetailMediaUiState> emit) {
    _isTracking = event.isTracking;
    emit(
      state.copyWith(
        detailAnimeModel:
            state.detailAnimeModel?.copyWith(isFollowing: event.isTracking),
      ),
    );
  }

  Future<void> _onToggleFollowState(
      OnToggleFollowState event, Emitter<DetailMediaUiState> emit) async {
    final status =
        event.isFollow ? MediaListStatus.current : MediaListStatus.dropped;

    add(_OnLoadingStateChanged(isLoading: true));
    final result = await _animeTrackListRepository.updateAnimeInTrackList(
        animeId: animeId, status: status);
    add(_OnLoadingStateChanged(isLoading: false));

    if (result is LoadError) {
      logger.d('toggle follow state failed');

//TODO: show dialog.
    } else {
      if (event.isFollow) {
        showSnackBarMessage(
          label: AFLocalizations.of().followNewAnimation,
          duration: SnackBarDuration.short,
        );
      } else {
        showSnackBarMessage(
          label: AFLocalizations.of().dropAnimation,
          duration: SnackBarDuration.short,
        );
      }
    }
  }

  FutureOr<void> _onLoadingStateChanged(
      _OnLoadingStateChanged event, Emitter<DetailMediaUiState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}