import 'package:aniflow/core/common/model/setting/setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_setting.g.dart';

@JsonEnum(alwaysCreate: true)
enum ThemeSetting implements Setting {
  @JsonValue('DARK')
  dark,
  @JsonValue('LIGHT')
  light,
  @JsonValue('SYSTEM')
  system;

  String toJson() => _$ThemeSettingEnumMap[this]!;

  static ThemeSetting? fromJson(String? json) =>
      _$ThemeSettingEnumMap.map((key, value) => MapEntry(value, key))[json];
}
