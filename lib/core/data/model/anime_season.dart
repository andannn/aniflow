part of '../repository/ani_list_repository.dart';

/// Bangumi releasing season.
@JsonEnum()
enum AnimeSeason {
  @JsonValue('WINTER')
  winter('WINTER'),
  @JsonValue('SPRING')
  spring('SPRING'),
  @JsonValue('SUMMER')
  summer('SUMMER'),
  @JsonValue('FALL')
  fall('FALL');

  final String sqlTypeString;

  const AnimeSeason(this.sqlTypeString);
}
