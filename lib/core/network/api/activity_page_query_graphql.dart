import 'package:aniflow/core/common/model/activity_type.dart';

class ActivityPageQueryParam {
  final int page;
  final int perPage;
  final int? userId;
  final ActivityType? type;
  final int? mediaId;
  final bool? isFollowing;

  const ActivityPageQueryParam(
      {required this.page,
      required this.perPage,
      this.userId,
      this.type,
      this.mediaId,
      this.isFollowing});
}

String get activitiesGraphQLString => '''
query (\$page: Int, \$perPage: Int, \$userId: Int, \$type: ActivityType, \$mediaId: Int, \$isFollowing: Boolean) {
  Page(page: \$page, perPage: \$perPage) {
    activities(userId: \$userId, type: \$type, mediaId: \$mediaId, isFollowing: \$isFollowing) {
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
      }
    }
  }
}
''';
