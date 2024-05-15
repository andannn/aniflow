// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_reply_subscription_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityReplySubscribedNotificationDtoImpl
    _$$ActivityReplySubscribedNotificationDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$ActivityReplySubscribedNotificationDtoImpl(
          id: (json['id'] as num?)?.toInt() ?? -1,
          type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
          userId: (json['userId'] as num?)?.toInt(),
          activityId: (json['activityId'] as num?)?.toInt(),
          context: json['context'] as String?,
          createdAt: (json['createdAt'] as num?)?.toInt(),
          user: json['user'] == null
              ? null
              : UserDto.fromJson(json['user'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ActivityReplySubscribedNotificationDtoImplToJson(
        _$ActivityReplySubscribedNotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'userId': instance.userId,
      'activityId': instance.activityId,
      'context': instance.context,
      'createdAt': instance.createdAt,
      'user': instance.user,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.airing: 'AIRING',
  NotificationType.activityLike: 'ACTIVITY_LIKE',
  NotificationType.activityReply: 'ACTIVITY_REPLY',
  NotificationType.activityMention: 'ACTIVITY_MENTION',
  NotificationType.activityReplyLike: 'ACTIVITY_REPLY_LIKE',
  NotificationType.activityMessage: 'ACTIVITY_MESSAGE',
  NotificationType.following: 'FOLLOWING',
  NotificationType.mediaDataChange: 'MEDIA_DATA_CHANGE',
  NotificationType.relatedMediaAddition: 'RELATED_MEDIA_ADDITION',
  NotificationType.mediaDeletion: 'MEDIA_DELETION',
  NotificationType.mediaMerge: 'MEDIA_MERGE',
};
