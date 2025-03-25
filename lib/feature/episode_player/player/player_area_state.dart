import 'package:aniflow/feature/episode_player/player/player_area_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_area_state.freezed.dart';

@freezed
class PlayerAreaState with _$PlayerAreaState {
  const factory PlayerAreaState({
    PlayerState? searchState
}) = _PlayerAreaState;
}
