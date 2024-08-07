import 'package:aniflow/core/common/definitions/home_sector_category.dart';
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
    @Default([]) List<HomeSectorCategory> sectors,
  }) = _DiscoverUiState;
}
