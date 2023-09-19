part of '../repository/ani_list_repository.dart';

/// Bangumi status.
@JsonEnum()
enum AnimeStatus {
  @JsonValue('RELEASING')
  releasing('RELEASING'),
  @JsonValue('FINISHED')
  finished('FINISHED'),
  @JsonValue('NOT_YET_RELEASED')
  notYetReleased('NOT_YET_RELEASED');

  final String sqlTypeString;

  const AnimeStatus(this.sqlTypeString);
}

