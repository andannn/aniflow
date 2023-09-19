part of '../repository/ani_list_repository.dart';

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
