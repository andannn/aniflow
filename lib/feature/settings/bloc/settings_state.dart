import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    @Default(ThemeSetting.system) ThemeSetting theme,
    @Default(MediaType.anime) MediaType type,
    @Default(ScoreFormat.point100) ScoreFormat selectedScoreFormat,
    @Default(UserTitleLanguage.native) UserTitleLanguage selectedTitleLanguage,
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage selectedStaffNameLanguage,
    @Default(false) bool displayAdultContent,
  }) = _SettingsState;
}
