import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/api/media_content_graphql.dart';
import 'package:aniflow/core/network/api/user_content_graphql.dart';

class NotificationQueryParam {
  final int page;
  final int? perPage;
  final List<NotificationType> type;

  NotificationQueryParam(
      {required this.page,
        this.perPage,
        this.type = const []});
}


String get notificationQueryGraphql => '''
query (\$page: Int, \$perPage: Int, \$type_in: [NotificationType]) {
  Page(page: \$page, perPage: \$perPage) {
    notifications(type_in: \$type_in) {
      __typename
      ... on AiringNotification {
        id
        type
        animeId
        episode
        contexts
        createdAt
        media {
          $mediaContentQueryGraphql
        }
      }
      ... on ActivityLikeNotification {
        id
        userId
        type
        context
        activityId
        createdAt
        activity {
          $activityUnionContentString
        }
        user {
          $userContentQueryGraphql
        }
      }
      ... on ActivityMentionNotification {
        id
        userId
        type
        activityId
        context
        createdAt
        activity {
          $activityUnionContentString
        }
        user {
          $userContentQueryGraphql
        }
      }
      ... on ActivityMessageNotification {
        id
        userId
        type
        activityId
        context
        createdAt
        message {
          id
        }
        user {
          $userContentQueryGraphql
        }
      }
      ... on ActivityReplySubscribedNotification {
        id
        userId
        type
        activityId
        context
        createdAt
        activity {
          $activityUnionContentString
        }
        user {
          $userContentQueryGraphql
        }
      }
      ... on ActivityReplyLikeNotification {
        id
        userId
        type
        activityId
        context
        createdAt
        activity {
          $activityUnionContentString
        }
        user {
          $userContentQueryGraphql
        }
      }
      ... on ActivityReplyNotification {
        id
        userId
        type
        activityId
        context
        createdAt
        activity {
          $activityUnionContentString
        }
        user {
          $userContentQueryGraphql
        }
      }
      ... on FollowingNotification {
        id
        userId
        type
        context
        createdAt
        user {
          $userContentQueryGraphql
        }
      }
      ... on MediaMergeNotification {
        id
        type
        mediaId
        deletedMediaTitles
        context
        reason
        createdAt
        media {
          $mediaContentQueryGraphql
        }
      }
      ... on MediaDataChangeNotification {
        id
        type
        mediaId
        context
        reason
        createdAt
        media {
          $mediaContentQueryGraphql
        }
      }
      ... on MediaDeletionNotification {
        id
        type
        deletedMediaTitle
        context
        reason
        createdAt
      }
      ... on RelatedMediaAdditionNotification {
        id
        type
        mediaId
        context
        createdAt
        media {
          $mediaContentQueryGraphql
        }
      }
    }
  }
}
''';
