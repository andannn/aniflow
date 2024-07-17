import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(ThemeSetting.system) ThemeSetting theme,
}) = _AppState;
}
