import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/network/api/common_graphql.dart';

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

  UserAnimeListPageQueryParam.all({
    required this.userId,
    this.mediaType,
    this.status = const [],
    required this.format,
  })  : page = -1,
        perPage = -1;

  bool get isRequestAllItem => page == -1;
}

String get userMediaListGraphQLString => '''
query(\$page: Int, \$perPage: Int, \$userId: Int, \$status_in: [MediaListStatus], \$type: MediaType, \$format: ScoreFormat){
  Page(page: \$page, perPage: \$perPage) {
    $pageInfo
    mediaList(userId: \$userId, type: \$type, status_in: \$status_in) {
      $mediaListContent
    }
  }
}
''';

String get singleMediaListGraphQLString => '''
query(\$mediaId: Int, \$userId: Int, \$format: ScoreFormat) {
  MediaList(mediaId: \$mediaId, userId: \$userId) {
    $mediaListContent
  }
}
''';

const mediaListContent = '''
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
''';
