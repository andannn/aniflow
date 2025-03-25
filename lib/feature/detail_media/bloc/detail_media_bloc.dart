import 'dart:async';

import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/message/snack_bar_message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_modify_result.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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

// class _OnHiAnimationEnabledChanged extends DetailAnimeEvent {
//   _OnHiAnimationEnabledChanged({required this.enabled});
//
//   final bool enabled;
// }

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
//
// class _OnEpisodeFound extends DetailAnimeEvent {
//   _OnEpisodeFound({required this.episode});
//
//   final Episode episode;
// }

class OnMarkWatchedClick extends DetailAnimeEvent {}

// class OnRetryGetHighAnimationSource extends DetailAnimeEvent {}

// class _OnFindEpisodeError extends DetailAnimeEvent {
//   _OnFindEpisodeError({
//     required this.exception,
//     this.searchUrl,
//   });
//
//   final Exception exception;
//   final String? searchUrl;
// }

// class _OnStartFindSource extends DetailAnimeEvent {}

// class HiAnimationSource extends Equatable {
//   final String animeId;
//   final int episode;
//   final List<String> keywords;
//
//   const HiAnimationSource(this.animeId, this.episode, this.keywords);
//
//   @override
//   List<Object?> get props => [animeId, episode, ...keywords];
// }

sealed class LoadingState<T> {
  const LoadingState();
}

class None<T> extends LoadingState<T> {
  const None();
}

class Loading<T> extends LoadingState<T> {}

class Ready<T> extends LoadingState<T> {
  final T state;

  Ready(this.state);
}

class Error<T> extends LoadingState<T> {
  final Exception exception;
  final String? searchUrl;

  Error(this.exception, this.searchUrl);
}

extension DetailMediaUiStateEx on DetailMediaUiState {
  bool get hasNextReleasedEpisode {
    if (mediaListItem == null) return false;
    if (detailAnimeModel == null) return false;

    return MediaWithListModel(
      mediaModel: detailAnimeModel!,
      mediaListModel: mediaListItem,
    ).hasNextReleasedEpisode;
  }
}

@injectable
class DetailMediaBloc extends Bloc<DetailAnimeEvent, DetailMediaUiState>
    with AutoCancelMixin {
  DetailMediaBloc(
    @factoryParam this.mediaId,
    this._authRepository,
    this._favoriteRepository,
    this._userDataRepository,
    this._mediaRepository,
    this._mediaListRepository,
    this._messageRepository,
  ) : super(DetailMediaUiState(
          userTitleLanguage: _userDataRepository.userTitleLanguage,
          userStaffNameLanguage: _userDataRepository.userStaffNameLanguage,
          scoreFormat: _userDataRepository.scoreFormat,
        )) {
    on<_OnDetailAnimeModelChangedEvent>(
      (event, emit) => emit(state.copyWith(detailAnimeModel: event.model)),
    );
    on<_OnMediaListItemChanged>(
      (event, emit) =>
          emit(state.copyWith(mediaListItem: event.mediaListItemModel)),
    );
    // on<_OnHiAnimationEnabledChanged>(
    //   (event, emit) =>
    //       emit(state.copyWith(isHiAnimationFeatureEnabled: event.enabled)),
    // );
    on<OnMediaListModified>(_onMediaListModified);
    on<OnToggleFavoriteState>(_onToggleFavoriteState);
    on<_OnLoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    // on<_OnEpisodeFound>(
    //   (event, emit) => emit(state.copyWith(episode: Ready(event.episode))),
    // );
    // on<_OnFindEpisodeError>(
    //   (event, emit) => emit(
    //       state.copyWith(episode: Error(event.exception, event.searchUrl))),
    // );
    // on<_OnStartFindSource>(
    //   (event, emit) => emit(state.copyWith(episode: Loading())),
    // );
    on<OnMarkWatchedClick>(_onMarkWatchedClick);
    // on<OnRetryGetHighAnimationSource>(_onRetryGetHighAnimationSource);

    _init();
  }

  final String mediaId;
  final MediaInformationRepository _mediaRepository;
  final MediaListRepository _mediaListRepository;
  final FavoriteRepository _favoriteRepository;
  final AuthRepository _authRepository;
  final UserDataRepository _userDataRepository;
  final MessageRepository _messageRepository;

  // HiAnimationSource? _hiAnimationSource;

  StreamSubscription? _isHiAnimationEnabledSub;

  CancelToken? _toggleFavoriteCancelToken;
  CancelToken? _networkActionCancelToken;
  CancelToken? _findPlaySourceCancelToken;

  void _init() async {
    autoCancel(
      () => _mediaRepository.getDetailMediaInfoStream(mediaId).listen(
        (animeModel) {
          safeAdd(_OnDetailAnimeModelChangedEvent(model: animeModel));
        },
      ),
    );

    final userData = await _authRepository.getAuthedUserStream().first;
    if (userData != null) {
      autoCancel(
        () => _mediaListRepository
            .getMediaListItemByUserAndIdStream(
                userId: userData.id, animeId: mediaId)
            .listen(
          (item) {
            safeAdd(_OnMediaListItemChanged(mediaListItemModel: item));
          },
        ),
      );
    }

    // _isHiAnimationEnabledSub =
    //     _userDataRepository.isHiAnimationFeatureEnabledStream.listen((enabled) {
    //   safeAdd(_OnHiAnimationEnabledChanged(enabled: enabled));
    // });

    /// start fetch detail anime info.
    /// detail info stream will emit new value when data ready.
    _startFetchDetailAnimeInfo();
  }

  @override
  Future<void> close() {
    _toggleFavoriteCancelToken?.cancel();
    _networkActionCancelToken?.cancel();
    _findPlaySourceCancelToken?.cancel();
    _isHiAnimationEnabledSub?.cancel();

    return super.close();
  }

  void _startFetchDetailAnimeInfo() async {
    _networkActionCancelToken?.cancel();
    _networkActionCancelToken = CancelToken();

    safeAdd(_OnLoadingStateChanged(isLoading: true));
    final resultList = await Future.wait([
      _mediaRepository.startFetchDetailAnimeInfo(
        id: mediaId,
        token: _networkActionCancelToken,
      ),
      _mediaListRepository.syncMediaListItem(
        mediaId: mediaId,
        format: _userDataRepository.scoreFormat,
        token: _networkActionCancelToken,
      ),
    ]);
    safeAdd(_OnLoadingStateChanged(isLoading: false));

    final fetchDetailResult = resultList[0];
    final syncListResult = resultList[1];
    if (fetchDetailResult is LoadError) {
      _messageRepository.handleException(fetchDetailResult.exception);
    }
    if (syncListResult is LoadError) {
      _messageRepository.handleException(syncListResult.exception);
    }
  }

  Future<void> _onMediaListModified(
      OnMediaListModified event, Emitter<DetailMediaUiState> emit) async {
    final state = event.result;

    safeAdd(_OnLoadingStateChanged(isLoading: true));
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
    safeAdd(_OnLoadingStateChanged(isLoading: false));

    if (result is LoadError) {
      final message =
          await ErrorHandler.convertExceptionToMessage(result.exception);
      if (message != null) {
        _messageRepository.showMessage(message);
      }
    }
  }

  FutureOr<void> _onToggleFavoriteState(
      OnToggleFavoriteState event, Emitter<DetailMediaUiState> emit) async {
    final mediaId = event.mediaId;

    _toggleFavoriteCancelToken?.cancel();
    _toggleFavoriteCancelToken = CancelToken();
    unawaited(_favoriteRepository.toggleFavoriteMedia(
        mediaId, _toggleFavoriteCancelToken!));
  }

  // void _updateHiAnimationSource(HiAnimationSource source,
  //     {bool isForce = false}) async {
  //   if (_hiAnimationSource != source || isForce) {
  //     _hiAnimationSource = source;
  //     _findPlaySourceCancelToken?.cancel();
  //     _findPlaySourceCancelToken = CancelToken();
  //     safeAdd(_OnStartFindSource());
  //     final result = await _hiAnimationRepository.searchPlaySourceByKeyword(
  //       source.animeId,
  //       source.keywords,
  //       source.episode.toString(),
  //       _findPlaySourceCancelToken,
  //     );
  //
  //     switch (result) {
  //       case LoadError<Episode>(exception: final exception):
  //         logger.d('findPlaySource failed ${result.exception}');
  //         if (exception is NotFoundEpisodeException) {
  //           safeAdd(_OnFindEpisodeError(
  //               exception: result.exception, searchUrl: exception.searchUrl));
  //         } else {
  //           safeAdd(_OnFindEpisodeError(exception: result.exception));
  //         }
  //
  //         final message =
  //             await ErrorHandler.convertExceptionToMessage(result.exception);
  //         if (message != null) {
  //           _messageRepository.showMessage(message);
  //         }
  //       case LoadSuccess<Episode>():
  //         logger.d('findPlaySource success ${result.data}');
  //         safeAdd(_OnEpisodeFound(episode: result.data));
  //     }
  //   }
  // }

  FutureOr<void> _onMarkWatchedClick(
    OnMarkWatchedClick event,
    Emitter<DetailMediaUiState> emit,
  ) async {
    logger.d('_onMarkWatchedClick.');
    final listItem = state.mediaListItem;
    final anime = state.detailAnimeModel;
    if (listItem == null || anime == null) {
      logger.d('_onMarkWatchedClick. listItem $listItem, anime $anime.');
      return;
    }

    final currentProgress = listItem.progress ?? 0;
    final nextEpisode = currentProgress + 1;
    final isFinished = nextEpisode == anime.episodes;
    final MediaListStatus status =
        isFinished ? MediaListStatus.completed : MediaListStatus.current;

    safeAdd(_OnLoadingStateChanged(isLoading: true));
    final result = await _mediaListRepository.updateMediaList(
        animeId: anime.id, status: status, progress: nextEpisode);
    safeAdd(_OnLoadingStateChanged(isLoading: false));

    if (result is LoadError) {
      final message =
          await ErrorHandler.convertExceptionToMessage(result.exception);
      if (message != null) {
        _messageRepository.showMessage(message);
      }
    } else {
      if (isFinished) {
        _messageRepository.showMessage(const MediaCompletedMessage());
      } else {
        _messageRepository.showMessage(const MediaMarkWatchedMessage());
      }
    }
  }
  //
  // FutureOr<void> _onRetryGetHighAnimationSource(
  //     OnRetryGetHighAnimationSource event, Emitter<DetailMediaUiState> emit) {
  //   final source = _hiAnimationSource;
  //   if (source != null) {
  //     _updateHiAnimationSource(source, isForce: true);
  //   }
  // }
}
