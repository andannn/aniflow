import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:bloc/bloc.dart';

sealed class DetailAnimeEvent {}

class _OnDetailAnimeModelChangedEvent extends DetailAnimeEvent {
  _OnDetailAnimeModelChangedEvent({required this.model});

  final MediaModel model;
}

class _OnMediaListItemChanged extends DetailAnimeEvent {
  _OnMediaListItemChanged({required this.mediaListItemModel});

  final MediaListItemModel? mediaListItemModel;
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
    on<_OnMediaListItemChanged>(_onMediaListItemChanged);
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

  void _init() async {
    _detailAnimeSub =
        _aniListRepository.getDetailAnimeInfoStream(animeId).listen(
      (animeModel) {
        add(_OnDetailAnimeModelChangedEvent(model: animeModel));
      },
    );

    final userData = await _authRepository.getAuthedUserStream().first;
    if (userData != null) {
      _isTrackingSub = _animeTrackListRepository
          .getMediaListItemByUserAndIdStream(
              userId: userData.id, animeId: animeId)
          .listen(
        (item) {
          add(_OnMediaListItemChanged(mediaListItemModel: item));
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
  }

  Future<void> _onToggleFollowState(
      OnToggleFollowState event, Emitter<DetailMediaUiState> emit) async {
    final status =
        event.isFollow ? MediaListStatus.current : MediaListStatus.dropped;

    add(_OnLoadingStateChanged(isLoading: true));
    final result = await _animeTrackListRepository.updateMediaList(
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

  FutureOr<void> _onMediaListItemChanged(
      _OnMediaListItemChanged event, Emitter<DetailMediaUiState> emit) {
    emit(
      state.copyWith(
        mediaListItem: event.mediaListItemModel,
      ),
    );
  }
}
