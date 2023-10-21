
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/feature/media_track/bloc/user_anime_list_load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_ui_state.freezed.dart';

@freezed
class TrackUiState with _$TrackUiState {
  factory TrackUiState({
    @Default(false) bool isLoading,
    @Default(false) bool showReleasedOnly,
    @Default(MediaType.anime) MediaType currentMediaType,
    @Default(MediaStateInitState()) MediaListLoadState animeLoadState,
  }) = _TrackUiState;
}
