part of '../repository/anime_track_list_repository.dart';

/// User anime list status.
@JsonEnum()
enum AnimeListStatus {
  @JsonValue('CURRENT')
  current('CURRENT'),
  @JsonValue('COMPLETED')
  completed('COMPLETED'),
  @JsonValue('DROPPED')
  dropped('DROPPED'),
  @JsonValue('PAUSED')
  paused('PAUSED'),
  @JsonValue('PLANNING')
  planning('PLANNING');

  final String sqlTypeString;

  const AnimeListStatus(this.sqlTypeString);
}
