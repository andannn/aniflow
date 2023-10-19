import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_media_ui_state.freezed.dart';

@freezed
class DetailMediaUiState with _$DetailMediaUiState {
  factory DetailMediaUiState({
    @Default(false) isLoading,
    MediaModel? detailAnimeModel,
  }) = _DetailMediaUiState;
}
