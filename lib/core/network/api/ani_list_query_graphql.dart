import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/model/anime_format.dart';
import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/common/model/anime_sort.dart';
import 'package:anime_tracker/core/common/model/anime_status.dart';

class AnimePageQueryParam {
  final int page;
  final int perPage;
  final int? seasonYear;
  final AnimeSeason? season;
  final AnimeStatus? status;
  final List<AnimeSort> animeSort;
  final List<AnimeFormat> animeFormat;

  AnimePageQueryParam(
      {required this.page,
      required this.perPage,
      this.seasonYear,
      this.season,
      this.status,
      this.animeSort = const [],
      this.animeFormat = const []});
}

AnimePageQueryParam createAnimePageQueryParam(AnimeCategory category,
    int page, int perPage, AnimeSeason currentSeason, int currentSeasonYear) {
  AnimeStatus? status;
  AnimeSeasonParam? seasonParam;
  List<AnimeSort> sorts = [];
  List<AnimeFormat> format = [];

  AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
    seasonYear: currentSeasonYear,
    season: currentSeason,
  );
  switch (category) {
    case AnimeCategory.currentSeason:
      status = null;
      seasonParam = currentSeasonParam;
      // sorts = [AnimeSort.latestUpdate];
      format = [AnimeFormat.tv, AnimeFormat.ova];
    case AnimeCategory.nextSeason:
      status = null;
      seasonParam = getNextSeasonParam(currentSeasonParam);
      format = [AnimeFormat.tv, AnimeFormat.ova];
    case AnimeCategory.trending:
      status = null;
      seasonParam = null;
      sorts = [AnimeSort.trending];
    case AnimeCategory.movie:
      status = null;
      seasonParam = null;
      format = [AnimeFormat.movie];
      sorts = [AnimeSort.trending];
  }

  return AnimePageQueryParam(
    page: page,
    perPage: perPage,
    seasonYear: seasonParam?.seasonYear,
    season: seasonParam?.season,
    status: status,
    animeSort: sorts,
    animeFormat: format,
  );
}

String get animeListQueryGraphQLString =>
'''
query (\$page: Int, \$perPage: Int, \$seasonYear: Int, \$season: MediaSeason, \$status: MediaStatus, \$sort: [MediaSort], \$format_in: [MediaFormat]) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: ANIME, seasonYear: \$seasonYear, season: \$season, status: \$status, sort: \$sort, format_in: \$format_in) {
      id
      type
      format
      status
      season
      coverImage {
        extraLarge
        large
        medium
        color
      }
      title {
        romaji
        english
        native
      }
    }
  }
}
''';
