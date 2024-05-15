// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_deletion_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaDeletionNotificationDtoImpl _$$MediaDeletionNotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaDeletionNotificationDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      deletedMediaTitle: json['deletedMediaTitle'] as String?,
      reason: json['reason'] as String?,
      context: json['context'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MediaDeletionNotificationDtoImplToJson(
        _$MediaDeletionNotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'deletedMediaTitle': instance.deletedMediaTitle,
      'reason': instance.reason,
      'context': instance.context,
      'createdAt': instance.createdAt,
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
