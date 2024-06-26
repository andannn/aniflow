
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_ui_state.freezed.dart';

@freezed
class TrackUiState with _$TrackUiState {
  factory TrackUiState({
    @Default(false) bool isLoading,
    @Default(false) bool showReleasedOnly,
    @Default(MediaType.anime) MediaType currentMediaType,
    SortedGroupMediaListModel? sortedGroupMediaListModel,
    AniListSettings? settings,
    UserModel? userData,
  }) = _TrackUiState;
}
