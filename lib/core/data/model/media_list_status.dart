part of '../media_list_repository.dart';

/// User anime list status.
@JsonEnum()
enum MediaListStatus {
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

  const MediaListStatus(this.sqlTypeString);
}
