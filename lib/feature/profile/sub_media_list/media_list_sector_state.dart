import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_sector_state.freezed.dart';

@freezed
class MediaListSectorState with _$MediaListSectorState {
  const factory MediaListSectorState({
    @Default([]) List<MediaWithListModel> mediaList,
}) = _MediaListSectorState;
}
