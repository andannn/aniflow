// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_reply_like_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivityReplyLikeNotificationDto
    _$$_ActivityReplyLikeNotificationDtoFromJson(Map<String, dynamic> json) =>
        _$_ActivityReplyLikeNotificationDto(
          id: json['id'] as int? ?? -1,
          type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
          userId: json['userId'] as int?,
          activityId: json['activityId'] as int?,
          context: json['context'] as String?,
          createdAt: json['createdAt'] as int?,
          user: json['user'] == null
              ? null
              : UserDataDto.fromJson(json['user'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_ActivityReplyLikeNotificationDtoToJson(
        _$_ActivityReplyLikeNotificationDto instance) =>
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
