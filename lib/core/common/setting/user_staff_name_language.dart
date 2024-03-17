import 'package:aniflow/core/common/setting/setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_staff_name_language.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserStaffNameLanguage implements Setting{
  /// The romanization of the staff or character's native name
  /// with western name ordering
  @JsonValue('ROMAJI_WESTERN')
  romajiWestern,

  /// The romanization of the staff or character's native name
  @JsonValue('ROMAJI')
  romaji,

  /// The staff or character's name in their native language
  @JsonValue('NATIVE')
  native;

  String toJson() => _$UserStaffNameLanguageEnumMap[this]!;

  static UserStaffNameLanguage? fromJson(String? json) =>
      _$UserStaffNameLanguageEnumMap
          .map((key, value) => MapEntry(value, key))[json];
}
