import '../../data/repository/ani_list_repository.dart';

typedef AnimePageQueryParam = ({
  int page,
  int perPage,
  int? seasonYear,
  AnimeSeason? season,
  AnimeStatus? status
});

String createAnimeListQueryGraphQLString(AnimePageQueryParam param) {
  final hasSeasonYear = param.seasonYear != null;
  final hasSeason = param.season != null;
  final hasStatus = param.status != null;
  return '''
query (\$page: Int, \$perPage: Int${hasSeasonYear ? ', \$seasonYear: Int' : ''}${hasSeason ? ', \$season: MediaSeason' : ''}${hasStatus ? ', \$status: MediaStatus' : ''}) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: ANIME${hasSeasonYear ? ', seasonYear: \$seasonYear' : ''}${hasSeason ? ', season: \$season' : ''}${hasStatus ? ', status: \$status' : ''}) {
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
}
