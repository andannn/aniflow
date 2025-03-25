import 'dart:ui';

import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/feature/episode_player/player/player_area_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

sealed class PlayerState extends Equatable {
  const PlayerState();
}

class Searching extends PlayerState {
  final MediaSource source;

  const Searching(this.source);

  @override
  List<Object?> get props => [source];
}

class LoadingPlayResource extends PlayerState {
  final MediaSource source;
  final List<Episode> episodes;

  const LoadingPlayResource({required this.source, required this.episodes});

  @override
  List<Object?> get props => [source, episodes];
}

class SearchError extends PlayerState {
  final MediaSource source;
  final Exception exception;

  const SearchError({required this.source, required this.exception});

  @override
  List<Object?> get props => [exception, source];
}

class PlayingResource extends PlayerState {
  final String url;
  final VideoPlayerValue playerState;

  const PlayingResource(this.url, this.playerState);

  @override
  List<Object?> get props => [url, playerState];
}

sealed class PlayerAreaEvent {}

class OnPlayableResourceLoaded extends PlayerAreaEvent {
  final String url;

  OnPlayableResourceLoaded(this.url);
}

class OnTogglePlayState extends PlayerAreaEvent { }
class OnSeekToPositionMs extends PlayerAreaEvent {
  final int positionMs;
  OnSeekToPositionMs(this.positionMs);
}

class _OnSearchStateChanged extends PlayerAreaEvent {
  final PlayerState searchState;

  _OnSearchStateChanged(this.searchState);
}

class _OnPlayStateChanged extends PlayerAreaEvent {
  final VideoPlayerValue state;

  _OnPlayStateChanged(this.state);
}

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
        newState = PlayingResource(lastSearchState.url, playerState);
      }
      emit(state.copyWith(searchState: newState));
    });
    on<OnPlayableResourceLoaded>(_handleLoadedPlayableResource);
    on<OnTogglePlayState>(_handleTogglePlayState);
    on<OnSeekToPositionMs>(_handleSeekToPositionMs);

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
    add(_OnSearchStateChanged(Searching(source)));

    final result = await _playableSourceRepository.searchPlaySource(
      source,
      param.mediaId,
      title.native,
      const Locale("jp"),
      param.episodeNum,
      token,
    );

    switch (result) {
      case LoadError<List<Episode>>():
        add(
          _OnSearchStateChanged(
            SearchError(source: source, exception: result.exception),
          ),
        );
      case LoadSuccess<List<Episode>>():
        add(
          _OnSearchStateChanged(
            LoadingPlayResource(source: source, episodes: result.data),
          ),
        );
    }

    return token;
  }

  VideoPlayerController? currentPlayerController;

  Future _handleLoadedPlayableResource(
      OnPlayableResourceLoaded event, Emitter<PlayerAreaState> emit) async {
    final webUrl = event.url;
    final controller = await _initPlayer(webUrl);

    emit(
        state.copyWith(searchState: PlayingResource(webUrl, controller.value)));
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
}
