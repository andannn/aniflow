import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/feature/episode_player/episode_player_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

class EpisodePlayerReq extends Equatable {
  final String mediaId;
  final int episodeNum;

  const EpisodePlayerReq({
    required this.mediaId,
    required this.episodeNum,
  });

  @override
  List<Object?> get props => [mediaId, episodeNum];
}

sealed class EpisodePlayerEvent {}

class OnMediaModelChanged extends EpisodePlayerEvent {
  final MediaModel mediaModel;

  OnMediaModelChanged(this.mediaModel);
}

class OnSelectMediaSource extends EpisodePlayerEvent {
  final MediaSource source;

  OnSelectMediaSource(this.source);
}

class OnPlayStateChanged extends EpisodePlayerEvent {
  final VideoPlayerValue state;

  OnPlayStateChanged(this.state);
}

class OnSelectEpisode extends EpisodePlayerEvent {
  final int episode;

  OnSelectEpisode(this.episode);
}

@injectable
class EpisodePlayerBloc extends Bloc<EpisodePlayerEvent, EpisodePlayerState>
    with AutoCancelMixin {
  EpisodePlayerBloc(
    @factoryParam this.param,
    this._playableSourceRepository,
    this._mediaInformationRepository,
  ) : super(EpisodePlayerState(selectedEpisodeNumber: param.episodeNum)) {
    on<OnMediaModelChanged>(
        (event, emit) => emit(state.copyWith(mediaModel: event.mediaModel)));
    on<OnSelectEpisode>((event, emit) =>
        emit(state.copyWith(selectedEpisodeNumber: event.episode)));
    on<OnSelectMediaSource>((event, emit) =>
        emit(state.copyWith(selectedMediaSource: event.source)));

    autoCancel(
      () => _mediaInformationRepository
          .getDetailMediaInfoStream(param.mediaId)
          .listen((data) => add(OnMediaModelChanged(data))),
    );

    // trigger search
    add(OnSelectMediaSource(MediaSource.vdm10));
  }

  final EpisodePlayerReq param;
  final PlayableSourceRepository _playableSourceRepository;
  final MediaInformationRepository _mediaInformationRepository;

  CancelToken? searchTask;

  @override
  void onChange(Change<EpisodePlayerState> change) {
    super.onChange(change);

    logger.d('JQN ${change.nextState}');
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
