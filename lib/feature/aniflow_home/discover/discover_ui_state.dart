import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_ui_state.freezed.dart';

@freezed
class DiscoverUiState with _$DiscoverUiState {
  factory DiscoverUiState({
    @Default(false) bool isLoading,
    @Default(MediaType.anime) MediaType currentMediaType,
    UserModel? userData,
    AniListSettings? settings,
  }) = _DiscoverUiState;
}
