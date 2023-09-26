import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';

class AnimePageQueryParam {
  final int page;
  final int perPage;
  final int? seasonYear;
  final AnimeSeason? season;
  final AnimeStatus? status;
  final List<AnimeSort> animeSort;
  final AnimeFormat? animeFormat;

  AnimePageQueryParam(
      {required this.page,
      required this.perPage,
      this.seasonYear,
      this.season,
      this.status,
      this.animeSort = const [],
      this.animeFormat});
}

String createAnimeListQueryGraphQLString() {
  return '''
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
}
