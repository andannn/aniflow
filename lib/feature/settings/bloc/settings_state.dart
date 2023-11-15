import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    AniListSettings? settings,
  }) = _SettingsState;
}
