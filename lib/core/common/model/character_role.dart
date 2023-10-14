import 'package:freezed_annotation/freezed_annotation.dart';

/// Bangumi character role.
@JsonEnum()
enum CharacterRole {
  @JsonValue('MAIN')
  main('MAIN'),
  @JsonValue('SUPPORTING')
  supporting('SUPPORTING'),
  @JsonValue('BACKGROUND')
  background('BACKGROUND');

  final String sqlTypeString;

  const CharacterRole(this.sqlTypeString);
}
