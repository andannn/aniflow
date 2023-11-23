import 'dart:async';

import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/common/error_handler.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:aniflow/feature/detail_media/update_media_list_bottom_sheet.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

sealed class DetailAnimeEvent {}

class _OnDetailAnimeModelChangedEvent extends DetailAnimeEvent {
  _OnDetailAnimeModelChangedEvent({required this.model});

  final MediaModel model;
}

class _OnMediaListItemChanged extends DetailAnimeEvent {
  _OnMediaListItemChanged({required this.mediaListItemModel});

  final MediaListItemModel? mediaListItemModel;
}

class OnMediaListModified extends DetailAnimeEvent {
  OnMediaListModified({required this.result});

  final MediaListModifyResult result;
}

class OnToggleFavoriteState extends DetailAnimeEvent {
  OnToggleFavoriteState({required this.isAnime, required this.mediaId});

  final bool isAnime;
  final String mediaId;
}

class _OnLoadingStateChanged extends DetailAnimeEvent {
  _OnLoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

class DetailMediaBloc extends Bloc<DetailAnimeEvent, DetailMediaUiState> {
  DetailMediaBloc({
    required this.animeId,
    required MediaInformationRepository aniListRepository,
    required AuthRepository authRepository,
    required FavoriteRepository favoriteRepository,
    required MediaListRepository animeTrackListRepository,
  })  : _aniListRepository = aniListRepository,
        _animeTrackListRepository = animeTrackListRepository,
        _favoriteRepository = favoriteRepository,
        _authRepository = authRepository,
        super(DetailMediaUiState()) {
    on<_OnDetailAnimeModelChangedEvent>(_onDetailAnimeModelChangedEvent);
    on<_OnMediaListItemChanged>(_onMediaListItemChanged);
    on<OnMediaListModified>(_onMediaListModified);
    on<OnToggleFavoriteState>(_onToggleFavoriteState);
    on<_OnLoadingStateChanged>(_onLoadingStateChanged);

    _init();
  }

  final String animeId;
  final MediaInformationRepository _aniListRepository;
  final MediaListRepository _animeTrackListRepository;
  final FavoriteRepository _favoriteRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _detailAnimeSub;
  StreamSubscription? _isTrackingSub;

  CancelToken? _cancelToken;

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

    _cancelToken?.cancel();

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

  Future<void> _onMediaListModified(
      OnMediaListModified event, Emitter<DetailMediaUiState> emit) async {
    final state = event.result;

    add(_OnLoadingStateChanged(isLoading: true));
    final result = await _animeTrackListRepository.updateMediaList(
      animeId: animeId,
      status: state.status,
      progress: state.progress,
      progressVolumes: state.progressVolumes,
      score: state.score,
      private: state.private,
      repeat: state.repeat,
      notes: state.notes,
      startedAt: state.startedAt,
      completedAt: state.completedAt,
    );
    add(_OnLoadingStateChanged(isLoading: false));

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }

  FutureOr<void> _onLoadingStateChanged(
      _OnLoadingStateChanged event, Emitter<DetailMediaUiState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  FutureOr<void> _onMediaListItemChanged(
      _OnMediaListItemChanged event, Emitter<DetailMediaUiState> emit) {
    emit(state.copyWith(mediaListItem: event.mediaListItemModel));
  }

  FutureOr<void> _onToggleFavoriteState(
      OnToggleFavoriteState event, Emitter<DetailMediaUiState> emit) async {
    final isAnime = event.isAnime;
    final mediaId = event.mediaId;

    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    if (isAnime) {
      unawaited(
          _favoriteRepository.toggleFavoriteAnime(mediaId, _cancelToken!));
    } else {
      unawaited(
          _favoriteRepository.toggleFavoriteManga(mediaId, _cancelToken!));
    }
  }
}
