import 'package:json_annotation/json_annotation.dart';

part 'home_sector_category.g.dart';

@JsonEnum(alwaysCreate: true)
enum HomeSectorCategory {
  @JsonValue('upNext')
  upNext,
  @JsonValue('birthdayCharacters')
  birthdayCharacters,
  @JsonValue('todaySchedule')
  todaySchedule,
  @JsonValue('currentSeasonAnime')
  currentSeasonAnime,
  @JsonValue('nextSeasonAnime')
  nextSeasonAnime,
  @JsonValue('trendingAnime')
  trendingAnime,
  @JsonValue('movieAnime')
  movieAnime,
  @JsonValue('trendingManga')
  trendingManga,
  @JsonValue('allTimePopularManga')
  allTimePopularManga,
  @JsonValue('topManhwa')
  topManhwa;
}
