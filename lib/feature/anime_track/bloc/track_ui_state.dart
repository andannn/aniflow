
import 'package:anime_tracker/feature/anime_track/bloc/user_anime_list_load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_ui_state.freezed.dart';

@freezed
class TrackUiState with _$TrackUiState {
  factory TrackUiState({
    @Default(false) bool isLoading,
    @Default(false) bool showReleasedOnly,
    @Default(UserAnimeInitState()) UserAnimeLoadState animeLoadState,
  }) = _TrackUiState;
}
