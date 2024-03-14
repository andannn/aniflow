
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_season.g.dart';

/// Bangumi releasing season.
@JsonEnum(alwaysCreate: true)
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

  String toJson() => _$AnimeSeasonEnumMap[this]!;

  static AnimeSeason? fromJson(String? json) =>
      _$AnimeSeasonEnumMap.map((key, value) => MapEntry(value, key))[json];
}

/// parameter present to anime season.
class AnimeSeasonParam extends Equatable {
  final int seasonYear;
  final AnimeSeason season;

  const AnimeSeasonParam({required this.seasonYear, required this.season});

  @override
  List<Object?> get props => [seasonYear, season];
}

/// get next bangumi season.
AnimeSeasonParam getNextSeasonParam(AnimeSeasonParam current) {
  int nextSeasonYear;
  AnimeSeason nextSeason;
  switch (current.season) {
    case AnimeSeason.winter:
      nextSeasonYear = current.seasonYear;
      nextSeason = AnimeSeason.spring;
    case AnimeSeason.spring:
      nextSeasonYear = current.seasonYear;
      nextSeason = AnimeSeason.summer;
    case AnimeSeason.summer:
      nextSeasonYear = current.seasonYear;
      nextSeason = AnimeSeason.fall;
    case AnimeSeason.fall:
      nextSeasonYear = current.seasonYear + 1;
      nextSeason = AnimeSeason.winter;
  }
  return AnimeSeasonParam(
    seasonYear: nextSeasonYear,
    season: nextSeason,
  );
}
