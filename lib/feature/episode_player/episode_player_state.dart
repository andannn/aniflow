import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_player_state.freezed.dart';

@freezed
class EpisodePlayerState with _$EpisodePlayerState {
  const factory EpisodePlayerState({
    MediaSource? selectedMediaSource,
    MediaModel? mediaModel,
  }) = _EpisodePlayerState;
}
