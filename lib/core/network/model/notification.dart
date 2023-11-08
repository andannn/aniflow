import 'package:aniflow/core/network/model/activity_like_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_message_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_reply_like_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_reply_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_reply_subscription_notification_dto.dart';
import 'package:aniflow/core/network/model/airing_notification_dto.dart';
import 'package:aniflow/core/network/model/following_notification_dto.dart';
import 'package:aniflow/core/network/model/media_data_change_notification_dto.dart';
import 'package:aniflow/core/network/model/media_deletion_notification_dto.dart';
import 'package:aniflow/core/network/model/media_merge_notification_dto.dart';
import 'package:aniflow/core/network/model/related_media_addition_notification_dto.dart';

abstract class AniNotification {
  static AniNotification mapToAniNotification(Map<String, dynamic> jsonMap) {
    switch (jsonMap['__typename']) {
      case 'ActivityLikeNotification':
        return ActivityLikeNotificationDto.fromJsonWithActivity(jsonMap);
      case 'AiringNotification':
        return AiringNotificationDto.fromJson(jsonMap);
      case 'FollowingNotification':
        return FollowingNotificationDto.fromJson(jsonMap);
      case 'MediaDataChangeNotification':
        return MediaDataChangeNotificationDto.fromJson(jsonMap);
      case 'RelatedMediaAdditionNotification':
        return RelatedMediaAdditionNotificationDto.fromJson(jsonMap);
      case 'MediaDeletionNotification':
        return MediaDeletionNotificationDto.fromJson(jsonMap);
      case 'MediaMergeNotification':
        return MediaMergeNotificationDto.fromJson(jsonMap);
      case 'ActivityReplyNotification':
        return ActivityReplyNotificationDto.fromJsonWithActivity(jsonMap);
      case 'ActivityReplyLikeNotification':
        return ActivityReplyLikeNotificationDto.fromJsonWithActivity(jsonMap);
      case 'ActivityReplySubscribedNotification':
        return ActivityReplySubscribedNotificationDto.fromJsonWithActivity(
            jsonMap);
      case 'ActivityMessageNotification':
        return ActivityMessageNotificationDto.fromJsonWithActivity(jsonMap);
    }

    throw Exception('InvalidType');
  }
}
