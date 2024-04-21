import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_media_ui_state.freezed.dart';

@freezed
class DetailMediaUiState with _$DetailMediaUiState {
  factory DetailMediaUiState({
    @Default(false) bool isLoading,
    MediaModel? detailAnimeModel,
    MediaListItemModel? mediaListItem,
    @Default(None<Episode>()) LoadingState<Episode> episode,
  }) = _DetailMediaUiState;
}
