import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_update_page_state.freezed.dart';

@freezed
class MediaListUpdatePageState with _$MediaListUpdatePageState {
  const factory MediaListUpdatePageState({
    MediaListItemModel? mediaListItemModel,
  }) = _MediaListUpdatePageState;
}
