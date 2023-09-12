import '../../data/repository/ani_list_repository.dart';

class AnimePageQueryParam {
  final int page;
  final int perPage;
  final int? seasonYear;
  final AnimeSeason? season;
  final AnimeStatus? status;
  final List<AnimeSort> animeSort;

  AnimePageQueryParam(
      {required this.page,
      required this.perPage,
      this.seasonYear,
      this.season,
      this.status,
      this.animeSort = const []});
}

String createAnimeListQueryGraphQLString(AnimePageQueryParam param) {
  final hasSeasonYear = param.seasonYear != null;
  final hasSeason = param.season != null;
  final hasStatus = param.status != null;
  final hasAnimeSort = param.animeSort.isNotEmpty;
  return '''
query (\$page: Int, \$perPage: Int${hasSeasonYear ? ', \$seasonYear: Int' : ''}${hasSeason ? ', \$season: MediaSeason' : ''}${hasStatus ? ', \$status: MediaStatus' : ''}${hasAnimeSort ? ', \$sort: [MediaSort]' : ''}) {
  Page(page: \$page, perPage: \$perPage) {
    media: media(type: ANIME${hasSeasonYear ? ', seasonYear: \$seasonYear' : ''}${hasSeason ? ', season: \$season' : ''}${hasStatus ? ', status: \$status' : ''}${hasAnimeSort ? ', sort: \$sort' : ''}) {
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
