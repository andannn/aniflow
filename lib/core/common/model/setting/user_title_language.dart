import 'package:aniflow/core/common/model/setting/setting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_title_language.g.dart';

/// The language the user wants to see media titles in
@JsonEnum(alwaysCreate: true)
enum UserTitleLanguage implements Setting {
  @JsonValue('ROMAJI')
  romaji,

  /// The romanization of the native language title
  @JsonValue('ENGLISH')
  english,

  /// The official english title
  @JsonValue('NATIVE')
  native;

  String toJson() => _$UserTitleLanguageEnumMap[this]!;

  factory UserTitleLanguage.fromJson(String json) => _$UserTitleLanguageEnumMap
      .map((key, value) => MapEntry(value, key))[json]!;
}
