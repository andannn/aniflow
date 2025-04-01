import 'dart:ui';

import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/feature/episode_player/player/player_area_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

sealed class PlayerState extends Equatable {
  final MediaSource source;

  const PlayerState({required this.source});
}

class Searching extends PlayerState {
  const Searching({required super.source});

  @override
  List<Object?> get props => [source];
}

class SearchError extends PlayerState {
  final Exception exception;

  const SearchError({required super.source, required this.exception});

  @override
  List<Object?> get props => [exception, source];
}

abstract class EpisodeLoaded extends PlayerState {
  const EpisodeLoaded(
      {required super.source,
      required this.matchedList,
      required this.currentIndex});

  final List<MatchedEpisode> matchedList;
  final int currentIndex;

  MatchedEpisode get currentEpisode => matchedList[currentIndex];
}

class LoadingPlayResource extends EpisodeLoaded {
  const LoadingPlayResource({
    required super.source,
    required super.matchedList,
    required super.currentIndex,
  });

  @override
  List<Object?> get props => [source, matchedList, currentIndex];
}

class LoadResourceError extends EpisodeLoaded {
  final Exception exception;

  const LoadResourceError(
      {required super.source,
      required super.matchedList,
      required super.currentIndex,
      required this.exception});

  @override
  List<Object?> get props => [exception, source, matchedList, currentIndex];
}

class PlayingResource extends EpisodeLoaded {
  final String url;
  final VideoPlayerValue playerState;

  const PlayingResource(
      {required super.source,
      required this.url,
      required this.playerState,
      required super.matchedList,
      required super.currentIndex});

  @override
  List<Object?> get props =>
      [source, url, playerState, currentIndex, matchedList];
}

sealed class PlayerAreaEvent {}

class OnPlayableResourceLoaded extends PlayerAreaEvent {
  final String url;
  final MatchedEpisode episode;

  OnPlayableResourceLoaded(this.url, this.episode);
}

class OnTogglePlayState extends PlayerAreaEvent {}

class OnSeekToPositionMs extends PlayerAreaEvent {
  final int positionMs;

  OnSeekToPositionMs(this.positionMs);
}

class _OnSearchStateChanged extends PlayerAreaEvent {
  final PlayerState searchState;

  _OnSearchStateChanged(this.searchState);
}

class OnFetchResourceError extends PlayerAreaEvent {
  final Exception exception;

  OnFetchResourceError(this.exception);
}

class _OnPlayStateChanged extends PlayerAreaEvent {
  final VideoPlayerValue state;

  _OnPlayStateChanged(this.state);
}

class OnChangeMatchedEpisode extends PlayerAreaEvent {
  final MatchedEpisode episode;

  OnChangeMatchedEpisode(this.episode);
}

class OnRetryClick extends PlayerAreaEvent {}

class PlayerAreaParam extends Equatable {
  final String mediaId;
  final int episodeNum;
  final MediaSource source;

  const PlayerAreaParam(
      {required this.mediaId, required this.episodeNum, required this.source});

  @override
  List<Object?> get props => [mediaId, episodeNum, source];
}

@injectable
class PlayerAreaBloc extends Bloc<PlayerAreaEvent, PlayerAreaState> {
  PlayerAreaBloc(
    @factoryParam this.param,
    this._playableSourceRepository,
    this._mediaInformationRepository,
  ) : super(const PlayerAreaState()) {
    on<_OnSearchStateChanged>(
        (event, emit) => emit(state.copyWith(searchState: event.searchState)));
    on<_OnPlayStateChanged>((event, emit) {
      final playerState = event.state;
      final lastSearchState = state.searchState;
      PlayingResource? newState;
      if (lastSearchState is PlayingResource) {
        newState = PlayingResource(
          source: lastSearchState.source,
          url: lastSearchState.url,
          playerState: playerState,
          matchedList: lastSearchState.matchedList,
          currentIndex: lastSearchState.currentIndex,
        );
        emit(state.copyWith(searchState: newState));
      }
    });
    on<OnPlayableResourceLoaded>(_handleLoadedPlayableResource);
    on<OnTogglePlayState>(_handleTogglePlayState);
    on<OnSeekToPositionMs>(_handleSeekToPositionMs);
    on<OnFetchResourceError>(_handleFetchResourceError);
    on<OnChangeMatchedEpisode>(_handleOnChangeMatchedEpisode);
    on<OnRetryClick>(_handleOnRetryClick);

    _init();
  }

  final PlayerAreaParam param;
  final PlayableSourceRepository _playableSourceRepository;
  final MediaInformationRepository _mediaInformationRepository;

  CancelToken? searchTask;

  void _init() async {
    searchTask = await _startSearchTask();
  }

  @override
  Future<void> close() {
    searchTask?.cancel();
    currentPlayerController?.dispose();

    return super.close();
  }

  Future<CancelToken> _startSearchTask() async {
    final media = await _mediaInformationRepository.getMedia(param.mediaId);
    final title = media.title!;
    final source = param.source;
    final token = CancelToken();
    add(_OnSearchStateChanged(Searching(source: source)));

    final result = await _playableSourceRepository.searchPlaySource(
      source,
      param.mediaId,
      title.native,
      const Locale("ja"),
      param.episodeNum,
      token,
    );

    switch (result) {
      case LoadError<List<MatchedEpisode>>():
        add(
          _OnSearchStateChanged(
            SearchError(source: source, exception: result.exception),
          ),
        );
      case LoadSuccess<List<MatchedEpisode>>():
        // find episode. load resource from index 0.
        add(
          _OnSearchStateChanged(
            LoadingPlayResource(
              source: source,
              matchedList: result.data,
              currentIndex: 0,
            ),
          ),
        );
    }

    return token;
  }

  VideoPlayerController? currentPlayerController;

  Future _handleLoadedPlayableResource(
      OnPlayableResourceLoaded event, Emitter<PlayerAreaState> emit) async {
    final webUrl = event.url;
    final lastSearchState = state.searchState;
    if (lastSearchState is LoadingPlayResource) {
      final controller = await _initPlayer(webUrl);

      final list = lastSearchState.matchedList;
      emit(
        state.copyWith(
          searchState: PlayingResource(
            source: lastSearchState.source,
            url: webUrl,
            playerState: controller.value,
            matchedList: list,
            currentIndex: list.indexOf(event.episode),
          ),
        ),
      );

      // save last success matched media source.
      await _playableSourceRepository.setLastSuccessMatchedMediaSource(
        param.mediaId,
        lastSearchState.source,
      );
    }
  }

  Future _handleTogglePlayState(
      OnTogglePlayState event, Emitter<PlayerAreaState> emit) async {
    final controller = currentPlayerController;
    if (controller == null) return;
    if (controller.value.isPlaying) {
      await controller.pause();
    } else {
      await controller.play();
    }
  }

  Future _handleSeekToPositionMs(
      OnSeekToPositionMs event, Emitter<PlayerAreaState> emit) async {
    final controller = currentPlayerController;
    if (controller == null) return;
    await controller.seekTo(Duration(milliseconds: event.positionMs));
  }

  Future<VideoPlayerController> _initPlayer(String url) async {
    await currentPlayerController?.dispose();

    VideoPlayerController controller =
        VideoPlayerController.networkUrl(Uri.parse(url));
    await controller.initialize();
    await controller.play();
    controller.addListener(
      () {
        add(_OnPlayStateChanged(controller.value));
      },
    );
    currentPlayerController = controller;
    return controller;
  }

  Future _handleFetchResourceError(
      OnFetchResourceError event, Emitter<PlayerAreaState> emit) async {
    final searchedState = state.searchState;
    if (searchedState is LoadingPlayResource) {
      emit(
        state.copyWith(
          searchState: LoadResourceError(
            source: searchedState.source,
            matchedList: searchedState.matchedList,
            currentIndex: searchedState.currentIndex,
            exception: event.exception,
          ),
        ),
      );
    }
  }

  Future _handleOnChangeMatchedEpisode(
      OnChangeMatchedEpisode event, Emitter<PlayerAreaState> emit) async {
    final playerState = state.searchState;
    if (playerState == null) {
      return;
    }

    final matchedList = <MatchedEpisode>[];
    if (playerState is LoadingPlayResource) {
      matchedList.addAll(playerState.matchedList);
    } else if (playerState is PlayingResource) {
      matchedList.addAll(playerState.matchedList);
    }

    emit(
      state.copyWith(
        searchState: LoadingPlayResource(
          source: playerState.source,
          matchedList: matchedList,
          currentIndex: matchedList.indexOf(event.episode),
        ),
      ),
    );
  }

  Future _handleOnRetryClick(
      OnRetryClick event, Emitter<PlayerAreaState> emit) async {
    final playState = state.searchState;
    if (playState == null) {
      return;
    }

    switch (playState) {
      case LoadResourceError():
        add(
          _OnSearchStateChanged(
            LoadingPlayResource(
              source: playState.source,
              matchedList: playState.matchedList,
              currentIndex: playState.currentIndex,
            ),
          ),
        );
      case SearchError():
        searchTask?.cancel();
        searchTask = await _startSearchTask();
      default:
      // noop
    }
  }
}
