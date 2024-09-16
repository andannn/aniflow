import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_format.dart';
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
  final List<MediaSort> mediaSort;
  final List<MediaFormat> mediaFormat;
  final bool? isAdult;
  final DateTime? startDateGreater;
  final DateTime? endDateGreater;

  AnimePageQueryParam({
    required this.type,
    this.seasonYear,
    this.season,
    this.countryCode,
    this.status,
    this.mediaSort = const [],
    this.mediaFormat = const [],
    this.isAdult,
    this.startDateGreater,
    this.endDateGreater,
  });
}

AnimePageQueryParam createMediaPageQueryParamByCategory(
  MediaCategory category,
  AnimeSeason currentSeason,
  int currentSeasonYear,
  bool showAdultContents,
) {
  MediaStatus? status;
  AnimeSeasonParam? seasonParam;
  MediaType type = getMediaTypeByCategory(category);
  List<MediaSort> sorts = [];
  List<MediaFormat> format = [];
  CountryCode? code;

  AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
    seasonYear: currentSeasonYear,
    season: currentSeason,
  );
  switch (category) {
    case MediaCategory.currentSeasonAnime:
      status = null;
      seasonParam = currentSeasonParam;
      format = [
        MediaFormat.tv,
        MediaFormat.tvShort,
        MediaFormat.ova,
        MediaFormat.ona,
        MediaFormat.oneShot
      ];
    case MediaCategory.nextSeasonAnime:
      status = null;
      seasonParam = getNextSeasonParam(currentSeasonParam);
      format = [
        MediaFormat.tv,
        MediaFormat.tvShort,
        MediaFormat.ova,
        MediaFormat.ona,
        MediaFormat.oneShot
      ];
    case MediaCategory.trendingAnime:
      status = null;
      seasonParam = null;
      sorts = [MediaSort.trending];
    case MediaCategory.movieAnime:
      status = null;
      seasonParam = null;
      format = [MediaFormat.movie];
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
    case MediaCategory.newAddedAnime:
      status = null;
      seasonParam = null;
      format = [];
      sorts = [MediaSort.newest];
    case MediaCategory.newAddedManga:
      status = null;
      seasonParam = null;
      format = [];
      sorts = [MediaSort.newest];
  }

  return AnimePageQueryParam(
    seasonYear: seasonParam?.seasonYear,
    season: seasonParam?.season,
    type: type,
    countryCode: code,
    status: status,
    mediaSort: sorts,
    mediaFormat: format,
    isAdult: showAdultContents == false ? false : null,
  );
}

String get mediaListQueryGraphQLString => '''
query (\$page: Int, \$perPage: Int, \$type: MediaType, \$countryCode: CountryCode, \$seasonYear: Int, \$season: MediaSeason, \$status: MediaStatus, \$sort: [MediaSort], \$format_in: [MediaFormat], \$isAdult: Boolean, \$startDate_greater: FuzzyDateInt, \$endDate_lesser: FuzzyDateInt) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: \$type, countryOfOrigin: \$countryCode, seasonYear: \$seasonYear, season: \$season, status: \$status, sort: \$sort, format_in: \$format_in, isAdult: \$isAdult, startDate_greater: \$startDate_greater, endDate_lesser: \$endDate_lesser) {
      $mediaContentQueryGraphql
    }
  }
}
''';
