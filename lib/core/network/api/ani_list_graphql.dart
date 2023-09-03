import 'package:anime_tracker/core/network/ani_list_data_source.dart';

typedef AnimeListQueryParam = ({
  int page,
  int perPage,
  int seasonYear,
  AnimeSeason season,
  AnimeStatus status
});

const animeListQueryGraphQL = '''
query (\$page: Int, \$perPage: Int, \$seasonYear: Int, \$season: MediaSeason, \$status: MediaStatus) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: ANIME, seasonYear: \$seasonYear, season: \$season, status: \$status) {
      id
      type
      format
      status
      season
      coverImage {
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
