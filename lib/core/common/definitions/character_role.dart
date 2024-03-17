import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_role.g.dart';

/// Bangumi character role.
@JsonEnum(alwaysCreate: true)
enum CharacterRole {
  @JsonValue('MAIN')
  main('MAIN'),
  @JsonValue('SUPPORTING')
  supporting('SUPPORTING'),
  @JsonValue('BACKGROUND')
  background('BACKGROUND');

  final String sqlTypeString;

  const CharacterRole(this.sqlTypeString);

  String toJson() => _$CharacterRoleEnumMap[this]!;

  static CharacterRole? fromJson(String? json) =>
      _$CharacterRoleEnumMap.map((key, value) => MapEntry(value, key))[json];
}
