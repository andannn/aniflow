
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_ui_state.freezed.dart';

@freezed
class TrackUiState with _$TrackUiState {
  factory TrackUiState({
    @Default(false) bool isLoading,
    @Default(TrackListFilter.all) TrackListFilter trackListFilter,
    @Default(MediaType.anime) MediaType currentMediaType,
    SortedGroupMediaListModel? sortedGroupMediaListModel,
    UserModel? userData,
  }) = _TrackUiState;
}
