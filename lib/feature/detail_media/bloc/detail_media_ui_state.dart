import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_media_ui_state.freezed.dart';

@freezed
class DetailMediaUiState with _$DetailMediaUiState {
  factory DetailMediaUiState({
    @Default(false) bool isLoading,
    MediaModel? detailAnimeModel,
    MediaListItemModel? mediaListItem,
    Episode? episode,
  }) = _DetailMediaUiState;
}
