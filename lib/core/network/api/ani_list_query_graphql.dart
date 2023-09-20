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

String createAnimeListQueryGraphQLString(AnimePageQueryParam param) {
  final hasSeasonYear = param.seasonYear != null;
  final hasSeason = param.season != null;
  final hasStatus = param.status != null;
  final hasAnimeSort = param.animeSort.isNotEmpty;
  final hasAnimeFormat = param.animeFormat != null;
  return '''
query (\$page: Int, \$perPage: Int${hasSeasonYear ? ', \$seasonYear: Int' : ''}${hasSeason ? ', \$season: MediaSeason' : ''}${hasStatus ? ', \$status: MediaStatus' : ''}${hasAnimeSort ? ', \$sort: [MediaSort]' : ''}${hasAnimeFormat ? ', \$format_in: [MediaFormat]' : ''}) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: ANIME${hasSeasonYear ? ', seasonYear: \$seasonYear' : ''}${hasSeason ? ', season: \$season' : ''}${hasStatus ? ', status: \$status' : ''}${hasAnimeSort ? ', sort: \$sort' : ''}${hasAnimeFormat ? ', format_in: \$format_in' : ''}) {
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
