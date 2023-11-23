import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:aniflow/core/data/media_list_repository.dart';

class UserAnimeListPageQueryParam {
  final int page;
  final int? perPage;
  final int userId;
  final List<MediaListStatus> status;
  final MediaType? mediaType;
  final ScoreFormat format;

  UserAnimeListPageQueryParam({
    required this.page,
    required this.userId,
    this.perPage,
    this.mediaType,
    this.status = const [],
    required this.format,
  });
}

String get userAnimeListGraphQLString => '''
query(\$page: Int, \$perPage: Int, \$userId: Int, \$status_in: [MediaListStatus], \$type: MediaType, \$format: ScoreFormat){
  Page(page: \$page, perPage: \$perPage) {
    mediaList(userId: \$userId, type: \$type, status_in: \$status_in) {
      id
      status
      progress
      priority
      notes
      repeat
      private
      userId
      updatedAt
      score(format: \$format)
      progressVolumes
      startedAt {
        year
        month
        day
      }
      completedAt {
        year
        month
        day
      }
      media {
        id
        title {
          romaji
          english
          native
        }
        type
        description(asHtml: false)
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
