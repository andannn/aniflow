import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/usecase/media_mark_watched_use_case.dart';
import 'package:aniflow/feature/episode_player/episode_player_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

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

class _OnMediaModelChanged extends EpisodePlayerEvent {
  final MediaModel mediaModel;

  _OnMediaModelChanged(this.mediaModel);
}

class _OnMediaListItemChanged extends EpisodePlayerEvent {
  final MediaListItemModel? mediaListItemModel;

  _OnMediaListItemChanged(this.mediaListItemModel);
}

class OnSelectMediaSource extends EpisodePlayerEvent {
  final MediaSource source;

  OnSelectMediaSource(this.source);
}

class OnSelectEpisodeNumber extends EpisodePlayerEvent {
  final int episode;

  OnSelectEpisodeNumber(this.episode);
}

class OnMarkWatchedClick extends EpisodePlayerEvent {}

class OnPlayEnd extends EpisodePlayerEvent {}

@injectable
class EpisodePlayerBloc extends Bloc<EpisodePlayerEvent, EpisodePlayerState>
    with AutoCancelMixin {
  EpisodePlayerBloc(
    @factoryParam this.param,
    this._mediaListRepository,
    this._mediaInformationRepository,
    this._authRepository,
    this._mediaMarkWatchedUseCase,
    this._playableSourceRepository,
  ) : super(EpisodePlayerState(selectedEpisodeNumber: param.episodeNum)) {
    on<_OnMediaModelChanged>(
        (event, emit) => emit(state.copyWith(mediaModel: event.mediaModel)));
    on<OnSelectEpisodeNumber>((event, emit) =>
        emit(state.copyWith(selectedEpisodeNumber: event.episode)));
    on<OnSelectMediaSource>((event, emit) =>
        emit(state.copyWith(selectedMediaSource: event.source)));
    on<_OnMediaListItemChanged>((event, emit) =>
        emit(state.copyWith(mediaListItemModel: event.mediaListItemModel)));
    on<OnMarkWatchedClick>(_handleMarkWatchedClick);
    on<OnPlayEnd>(_handleOnPlayEnd);

    _init();

    // trigger search
    final initialMediaSource = _playableSourceRepository
            .getLastSuccessMatchedMediaSource(param.mediaId) ??
        MediaSource.dmdan8;
    add(OnSelectMediaSource(initialMediaSource));
  }

  final EpisodePlayerReq param;
  final MediaInformationRepository _mediaInformationRepository;
  final MediaListRepository _mediaListRepository;
  final AuthRepository _authRepository;
  final PlayableSourceRepository _playableSourceRepository;
  final MediaMarkWatchedUseCase _mediaMarkWatchedUseCase;

  void _init() async {
    autoCancel(
      () => _mediaInformationRepository
          .getDetailMediaInfoStream(param.mediaId)
          .listen((data) => add(_OnMediaModelChanged(data))),
    );
    final userData = await _authRepository.getAuthedUserStream().first;

    if (userData != null) {
      autoCancel(
        () => _mediaListRepository
            .getMediaListItemByUserAndIdStream(
                animeId: param.mediaId, userId: userData.id)
            .listen((data) => add(_OnMediaListItemChanged(data))),
      );
    }
  }

  Future<void> _handleMarkWatchedClick(
    OnMarkWatchedClick event,
    Emitter<EpisodePlayerState> emit,
  ) async {
    await _mediaMarkWatchedUseCase.onMarkWatched(
        param.mediaId, state.selectedEpisodeNumber, state.episodes);
  }

  Future _handleOnPlayEnd(
      OnPlayEnd event, Emitter<EpisodePlayerState> emit) async {
    final hasNextEpisode = haveNextEpisode(
        state.mediaModel,
        state.mediaListItemModel
            ?.copyWith(progress: state.selectedEpisodeNumber));
    logger.d(
        "${state.mediaModel?.id} ${state.mediaModel?.title?.native} play end. hasNextEpisode ${hasNextEpisode}");
    if (hasNextEpisode) {
      final nextEpisode = state.selectedEpisodeNumber + 1;
      add(OnSelectEpisodeNumber(nextEpisode));
    }
  }
}

extension EpisodePlayerStateEx on EpisodePlayerState {
  int? get progress => mediaListItemModel?.progress;

  int? get nextAiringEpisode => mediaModel?.nextAiringEpisode;

  int? get episodes => mediaModel?.episodes;
}
