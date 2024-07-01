import 'package:aniflow/core/common/definitions/notification_type.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/api/user_content_graphql.dart';

class NotificationQueryParam {
  final int page;
  final int? perPage;
  final List<NotificationType> type;
  final bool resetNotificationCount;
  NotificationQueryParam(
      {required this.page,
        this.perPage,
        required this.resetNotificationCount,
        this.type = const []});
}

String get _shortMediaContentQueryGraphql =>'''
      id
      coverImage {
        extraLarge
        large
        medium
      }
      title {
        romaji
        english
        native
      }
''';

    String get notificationQueryGraphql => '''
query (\$page: Int, \$perPage: Int, \$type_in: [NotificationType], \$resetNotificationCount: Boolean) {
  Page(page: \$page, perPage: \$perPage) {
    notifications(type_in: \$type_in, resetNotificationCount: \$resetNotificationCount) {
      __typename
      ... on AiringNotification {
        id
        type
        animeId
        episode
        contexts
        createdAt
        media {
          $_shortMediaContentQueryGraphql
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
          $_shortMediaContentQueryGraphql
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
          $_shortMediaContentQueryGraphql
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
          $_shortMediaContentQueryGraphql
        }
      }
    }
  }
}
''';
