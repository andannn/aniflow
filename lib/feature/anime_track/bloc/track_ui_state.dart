
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_ui_state.freezed.dart';

@freezed
class TrackUiState with _$TrackUiState {
  factory TrackUiState({
    @Default([]) List<AnimeListItemModel> watchingAnimeList,
  }) = _TrackUiState;
}
