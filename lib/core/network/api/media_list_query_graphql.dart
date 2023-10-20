import 'package:aniflow/core/data/media_list_repository.dart';

class UserAnimeListPageQueryParam {
  final int page;
  final int? perPage;
  final int userId;
  final List<MediaListStatus> status;

  UserAnimeListPageQueryParam(
      {required this.page,
      required this.userId, this.perPage,
      this.status = const []});
}

String get userAnimeListGraphQLString =>
'''
query(\$page: Int, \$perPage: Int, \$userId: Int, \$status_in: [MediaListStatus]){
  Page(page: \$page, perPage: \$perPage) {
    mediaList(userId: \$userId, type: ANIME, status_in: \$status_in) {
      id
      status
      score
      progress
      priority
      notes
      userId
      updatedAt
      media {
        id
        title {
          romaji
          english
          native
        }
        description(asHtml: true)
        episodes
        seasonYear
        season
        source
        status
        coverImage {
          extraLarge
          large
          medium
          color
        }
        averageScore
        favourites
        trending
        nextAiringEpisode {
          id
          airingAt
          episode
          timeUntilAiring
        }
      }
    }
  }
}
''';
