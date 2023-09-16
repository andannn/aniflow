import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_anime_ui_state.freezed.dart';

@freezed
class DetailAnimeUiState with _$DetailAnimeUiState {
  factory DetailAnimeUiState({
    DetailAnimeModel? detailAnimeModel,
  }) = _DetailAnimeUiState;
}
