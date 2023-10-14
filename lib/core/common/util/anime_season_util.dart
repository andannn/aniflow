import 'package:anime_tracker/core/common/model/anime_season.dart';

mixin AnimeSeasonUtil {
  /// get anime season params by DateTime.
  static AnimeSeasonParam getAnimeSeasonByDataTime(DateTime time) {
    final year = time.year;
    final month = time.month;

    AnimeSeason season;
    switch (month) {
      case >= 1 && < 4:
        season = AnimeSeason.winter;
      case >= 4 && < 7:
        season = AnimeSeason.spring;
      case >= 7 && < 10:
        season = AnimeSeason.summer;
      case >= 10:
        season = AnimeSeason.fall;
      default:
        throw 'impossible';
    }
    return AnimeSeasonParam(seasonYear: year, season: season);
  }
}
