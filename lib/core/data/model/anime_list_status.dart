part of '../repository/user_anime_list_repository.dart';

/// User anime list status.
@JsonEnum()
enum AnimeListStatus {
  @JsonValue('CURRENT')
  current('CURRENT'),
  @JsonValue('COMPLETED')
  completed('COMPLETED'),
  @JsonValue('DROPPED')
  dropped('DROPPED');

  final String sqlTypeString;

  const AnimeListStatus(this.sqlTypeString);
}