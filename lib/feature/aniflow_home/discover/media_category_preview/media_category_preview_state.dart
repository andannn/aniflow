import 'package:aniflow/core/data/model/media_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_category_preview_state.freezed.dart';

@freezed
class MediaCategoryPreviewState with _$MediaCategoryPreviewState {
  const factory MediaCategoryPreviewState({
    @Default([]) List<MediaModel> data,
  }) = _MediaCategoryPreviewState;
}
