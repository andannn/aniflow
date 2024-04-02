import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/update_media_list_bottom_sheet.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

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

class _OnEpisodeFound extends DetailAnimeEvent {
  _OnEpisodeFound({required this.episode});

  final Episode episode;
}

class HiAnimationSource extends Equatable {
  final int episode;
  final List<String> keywords;

  const HiAnimationSource(this.episode, this.keywords);

  @override
  List<Object?> get props => [episode, ...keywords];
}

@injectable
class DetailMediaBloc extends Bloc<DetailAnimeEvent, DetailMediaUiState> {
  DetailMediaBloc(
    @factoryParam this.mediaId,
    this._authRepository,
    this._favoriteRepository,
    this._mediaRepository,
    this._mediaListRepository,
    this._hiAnimationRepository,
  ) : super(DetailMediaUiState()) {
    on<_OnDetailAnimeModelChangedEvent>(
      (event, emit) => emit(state.copyWith(detailAnimeModel: event.model)),
    );
    on<_OnMediaListItemChanged>(
      (event, emit) =>
          emit(state.copyWith(mediaListItem: event.mediaListItemModel)),
    );
    on<OnMediaListModified>(_onMediaListModified);
    on<OnToggleFavoriteState>(_onToggleFavoriteState);
    on<_OnLoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<_OnEpisodeFound>(
      (event, emit) => emit(state.copyWith(episode: event.episode)),
    );

    _init();
  }

  final String mediaId;
  final MediaInformationRepository _mediaRepository;
  final MediaListRepository _mediaListRepository;
  final FavoriteRepository _favoriteRepository;
  final AuthRepository _authRepository;
  final HiAnimationRepository _hiAnimationRepository;

  HiAnimationSource? _hiAnimationSource;

  StreamSubscription? _detailAnimeSub;
  StreamSubscription? _isTrackingSub;

  CancelToken? _toggleFavoriteCancelToken;
  CancelToken? _networkActionCancelToken;
  CancelToken? _findPlaySourceCancelToken;

  void _init() async {
    _detailAnimeSub = _mediaRepository.getDetailMediaInfoStream(mediaId).listen(
      (animeModel) {
        add(_OnDetailAnimeModelChangedEvent(model: animeModel));
      },
    );

    final userData = await _authRepository.getAuthedUserStream().first;
    if (userData != null) {
      _isTrackingSub = _mediaListRepository
          .getMediaListItemByUserAndIdStream(
              userId: userData.id, animeId: mediaId)
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
  void onChange(Change<DetailMediaUiState> change) {
    super.onChange(change);
    final progress = change.nextState.mediaListItem?.progress;
    final title = change.nextState.detailAnimeModel?.title;
    if (progress != null && title != null) {
        _updateHiAnimationSource(
          HiAnimationSource(
            progress + 1,
            [title.english, title.romaji].whereNotNull().toList(),
          ),
        );
    }
  }

  @override
  Future<void> close() {
    _detailAnimeSub?.cancel();
    _isTrackingSub?.cancel();

    _toggleFavoriteCancelToken?.cancel();
    _networkActionCancelToken?.cancel();
    _findPlaySourceCancelToken?.cancel();

    return super.close();
  }

  void _startFetchDetailAnimeInfo() async {
    _networkActionCancelToken?.cancel();
    _networkActionCancelToken = CancelToken();

    add(_OnLoadingStateChanged(isLoading: true));
    final results = await Future.wait([
      _mediaRepository.startFetchDetailAnimeInfo(
        id: mediaId,
        token: _networkActionCancelToken,
      ),
      _mediaListRepository.syncMediaListItem(
        mediaId: mediaId,
        format: AniFlowPreferences().aniListSettings.value.scoreFormat,
        token: _networkActionCancelToken,
      ),
    ]);
    add(_OnLoadingStateChanged(isLoading: false));

    final result = results.whereType<LoadError>().firstOrNull;
    if (result != null) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }

  Future<void> _onMediaListModified(
      OnMediaListModified event, Emitter<DetailMediaUiState> emit) async {
    final state = event.result;

    add(_OnLoadingStateChanged(isLoading: true));
    final result = await _mediaListRepository.updateMediaList(
      animeId: mediaId,
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

  FutureOr<void> _onToggleFavoriteState(
      OnToggleFavoriteState event, Emitter<DetailMediaUiState> emit) async {
    final isAnime = event.isAnime;
    final mediaId = event.mediaId;

    _toggleFavoriteCancelToken?.cancel();
    _toggleFavoriteCancelToken = CancelToken();
    if (isAnime) {
      unawaited(_favoriteRepository.toggleFavoriteAnime(
          mediaId, _toggleFavoriteCancelToken!));
    } else {
      unawaited(_favoriteRepository.toggleFavoriteManga(
          mediaId, _toggleFavoriteCancelToken!));
    }
  }

  void _updateHiAnimationSource(HiAnimationSource source) async {
    logger.d('findPlaySource source ${source}');
    if (_hiAnimationSource != source) {
      _hiAnimationSource = source;
      _findPlaySourceCancelToken?.cancel();
      _findPlaySourceCancelToken = CancelToken();
      final result = await _hiAnimationRepository.searchPlaySourceByKeyword(
        source.keywords,
        source.episode.toString(),
        _findPlaySourceCancelToken,
      );

      switch (result) {
        case LoadError<Episode>():
          logger.d('findPlaySource failed ${result.exception}');
          ErrorHandler.handleException(exception: result.exception);
        case LoadSuccess<Episode>():
          logger.d('findPlaySource success ${result.data}');
          add(_OnEpisodeFound(episode: result.data));
      }
    }
  }
}
