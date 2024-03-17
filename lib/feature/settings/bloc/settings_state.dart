import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    AniListSettings? settings,
    @Default(ThemeSetting.system) ThemeSetting theme,
    @Default(MediaType.anime) MediaType type,
  }) = _SettingsState;
}
