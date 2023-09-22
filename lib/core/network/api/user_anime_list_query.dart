import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';

class UserAnimeListPageQueryParam {
  final int page;
  final int? perPage;
  final int userId;
  final List<AnimeListStatus> status;

  UserAnimeListPageQueryParam(
      {required this.page,
      required this.userId, this.perPage,
      this.status = const []});
}

String createUserAnimeListGraphQLString(UserAnimeListPageQueryParam param) {
  final hasAnimeSort = param.status.isNotEmpty;
  final hasPerPage = param.perPage != null;

  return '''
query(\$page: Int${hasPerPage ? ', \$perPage: Int' : ''}, \$userId: Int${hasAnimeSort ? ', \$status_in: [MediaListStatus]' : ''}){
  Page(page: \$page${hasPerPage ? ', perPage: \$perPage' : ''}) {
    mediaList(userId: \$userId, type: ANIME${hasAnimeSort ? ', status_in: \$status_in' : ''}) {
      id
      status
      score
      progress
      priority
      notes
      updatedAt
      media {
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
}
''';
}
