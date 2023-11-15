import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_language.g.dart';

@JsonEnum(alwaysCreate: true)
enum StaffLanguage {
  @JsonValue('JAPANESE')
  japanese,

  @JsonValue('ENGLISH')
  english,

  @JsonValue('KOREAN')
  korean,

  @JsonValue('ITALIAN')
  italian,

  @JsonValue('SPANISH')
  spanish,

  @JsonValue('PORTUGUESE')
  portuguese,

  @JsonValue('FRENCH')
  french,

  @JsonValue('GERMAN')
  german,

  @JsonValue('HEBREW')
  hebrew,

  @JsonValue('HUNGARIAN')
  hungarian;

  String toJson() => _$StaffLanguageEnumMap[this]!;

  factory StaffLanguage.fromJson(String json) =>
      _$StaffLanguageEnumMap
          .map((key, value) => MapEntry(value, key))[json]!;
}

