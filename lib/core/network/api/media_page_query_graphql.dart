import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/model/anime_format.dart';
import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/common/model/media_sort.dart';
import 'package:anime_tracker/core/common/model/media_status.dart';
import 'package:anime_tracker/core/common/model/media_type.dart';

class AnimePageQueryParam {
  final int? seasonYear;
  final AnimeSeason? season;
  final MediaStatus? status;
  final MediaType type;
  final List<MediaSort> animeSort;
  final List<AnimeFormat> animeFormat;

  AnimePageQueryParam(
      {required this.type,
      this.seasonYear,
      this.season,
      this.status,
      this.animeSort = const [],
      this.animeFormat = const []});
}

AnimePageQueryParam createAnimePageQueryParam(
    MediaCategory category, AnimeSeason currentSeason, int currentSeasonYear) {
  MediaStatus? status;
  AnimeSeasonParam? seasonParam;
  MediaType type = getMediaTypeByCategory(category);
  List<MediaSort> sorts = [];
  List<AnimeFormat> format = [];

  AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
    seasonYear: currentSeasonYear,
    season: currentSeason,
  );
  switch (category) {
    case MediaCategory.currentSeason:
      status = null;
      seasonParam = currentSeasonParam;
      // sorts = [AnimeSort.latestUpdate];
      format = [AnimeFormat.tv, AnimeFormat.ova];
    case MediaCategory.nextSeason:
      status = null;
      seasonParam = getNextSeasonParam(currentSeasonParam);
      format = [AnimeFormat.tv, AnimeFormat.ova];
    case MediaCategory.trending:
      status = null;
      seasonParam = null;
      sorts = [MediaSort.trending];
    case MediaCategory.movie:
      status = null;
      seasonParam = null;
      format = [AnimeFormat.movie];
      sorts = [MediaSort.trending];
  }

  return AnimePageQueryParam(
    seasonYear: seasonParam?.seasonYear,
    season: seasonParam?.season,
    type: type,
    status: status,
    animeSort: sorts,
    animeFormat: format,
  );
}

String get animeListQueryGraphQLString => '''
query (\$page: Int, \$perPage: Int, \$type: Int, \$seasonYear: Int, \$season: MediaSeason, \$status: MediaStatus, \$sort: [MediaSort], \$format_in: [MediaFormat]) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: \$type, seasonYear: \$seasonYear, season: \$season, status: \$status, sort: \$sort, format_in: \$format_in) {
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
