import 'package:aniflow/core/common/model/activity_type.dart';

class ActivityPageQueryParam {
  final int? userId;
  final List<ActivityType> type;
  final int? mediaId;
  final bool? isFollowing;
  final bool? hasReplies;

  const ActivityPageQueryParam({
    this.userId,
    this.type = const [],
    this.mediaId,
    this.isFollowing,
    this.hasReplies,
  });
}

String get activitiesGraphQLString => '''
query (\$page: Int, \$perPage: Int, \$userId: Int, \$type_in: [ActivityType], \$mediaId: Int, \$isFollowing: Boolean, \$hasReplies: Boolean) {
  Page(page: \$page, perPage: \$perPage) {
    activities(userId: \$userId, type_in: \$type_in, mediaId: \$mediaId, isFollowing: \$isFollowing, sort: ID_DESC, hasReplies: \$hasReplies) {
      __typename
      ... on TextActivity {
        id
        text(asHtml: true)
        userId
        type
        replyCount
        siteUrl
        isLocked
        isLiked
        likeCount
        isPinned
        createdAt
        user {
          id
          name
          avatar {
            large
            medium
          }
          bannerImage
        }
      }
      ... on ListActivity {
        id
        status
        progress
        userId
        type
        replyCount
        siteUrl
        isLocked
        isLiked
        likeCount
        isPinned
        createdAt
        user {
          id
          name
          avatar {
            large
            medium
          }
          bannerImage
        }
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
}
''';
