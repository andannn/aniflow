import 'package:aniflow/core/data/model/notification_type.dart';

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
          id
          type
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
      ... on ActivityLikeNotification {
        id
        userId
        type
        context
        activityId
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
      ... on ActivityMentionNotification {
        id
        userId
        type
        activityId
        context
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
          id
          name
          avatar {
            large
            medium
          }
          bannerImage
        }
      }
      ... on ActivityReplySubscribedNotification {
        id
        userId
        type
        activityId
        context
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
      ... on ActivityReplyLikeNotification {
        id
        userId
        type
        activityId
        context
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
      ... on ActivityReplyNotification {
        id
        userId
        type
        activityId
        context
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
      ... on FollowingNotification {
        id
        userId
        type
        context
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
      ... on MediaMergeNotification {
        id
        type
        mediaId
        deletedMediaTitles
        context
        reason
        createdAt
        media {
          id
          type
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
      ... on MediaDataChangeNotification {
        id
        type
        mediaId
        context
        reason
        createdAt
        media {
          id
          type
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
          id
          type
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
