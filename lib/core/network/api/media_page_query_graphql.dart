import 'package:aniflow/core/common/definitions/anime_format.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/network/api/media_content_graphql.dart';
import 'package:country_code/country_code.dart';

class AnimePageQueryParam {
  final int? seasonYear;
  final AnimeSeason? season;
  final MediaStatus? status;
  final CountryCode? countryCode;
  final MediaType type;
  final List<MediaSort> animeSort;
  final List<AnimeFormat> animeFormat;
  final bool? isAdult;

  AnimePageQueryParam({
    required this.type,
    this.seasonYear,
    this.season,
    this.countryCode,
    this.status,
    this.animeSort = const [],
    this.animeFormat = const [],
    this.isAdult,
  });
}

AnimePageQueryParam createAnimePageQueryParam(
  MediaCategory category,
  AnimeSeason currentSeason,
  int currentSeasonYear,
  bool showAdultContents,
) {
  MediaStatus? status;
  AnimeSeasonParam? seasonParam;
  MediaType type = getMediaTypeByCategory(category);
  List<MediaSort> sorts = [];
  List<AnimeFormat> format = [];
  CountryCode? code;

  AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
    seasonYear: currentSeasonYear,
    season: currentSeason,
  );
  switch (category) {
    case MediaCategory.currentSeasonAnime:
      status = null;
      seasonParam = currentSeasonParam;
      // sorts = [AnimeSort.latestUpdate];
      format = [AnimeFormat.tv, AnimeFormat.ova];
    case MediaCategory.nextSeasonAnime:
      status = null;
      seasonParam = getNextSeasonParam(currentSeasonParam);
      format = [AnimeFormat.tv, AnimeFormat.ova];
    case MediaCategory.trendingAnime:
      status = null;
      seasonParam = null;
      sorts = [MediaSort.trending];
    case MediaCategory.movieAnime:
      status = null;
      seasonParam = null;
      format = [AnimeFormat.movie];
      sorts = [MediaSort.trending];
    case MediaCategory.trendingManga:
      status = null;
      seasonParam = null;
      format = [];
      sorts = [MediaSort.trending];
    case MediaCategory.allTimePopularManga:
      status = null;
      seasonParam = null;
      format = [];
      sorts = [MediaSort.popularity];
    case MediaCategory.topManhwa:
      status = null;
      seasonParam = null;
      code = CountryCode.KR;
      format = [];
      sorts = [MediaSort.popularity];
  }

  return AnimePageQueryParam(
    seasonYear: seasonParam?.seasonYear,
    season: seasonParam?.season,
    type: type,
    countryCode: code,
    status: status,
    animeSort: sorts,
    animeFormat: format,
    isAdult: showAdultContents == false ? false: null,
  );
}

String get animeListQueryGraphQLString => '''
query (\$page: Int, \$perPage: Int, \$type: MediaType, \$countryCode: CountryCode, \$seasonYear: Int, \$season: MediaSeason, \$status: MediaStatus, \$sort: [MediaSort], \$format_in: [MediaFormat], \$isAdult: Boolean) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: \$type, countryOfOrigin: \$countryCode, seasonYear: \$seasonYear, season: \$season, status: \$status, sort: \$sort, format_in: \$format_in, isAdult: \$isAdult) {
      $mediaContentQueryGraphql
    }
  }
}
''';
