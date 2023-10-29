// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_deletion_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaDeletionNotificationDto _$$_MediaDeletionNotificationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MediaDeletionNotificationDto(
      id: json['id'] as int? ?? -1,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      deletedMediaTitle: json['deletedMediaTitle'] as String?,
      reason: json['reason'] as String?,
      contexts: (json['contexts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] as int?,
    );

Map<String, dynamic> _$$_MediaDeletionNotificationDtoToJson(
        _$_MediaDeletionNotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'deletedMediaTitle': instance.deletedMediaTitle,
      'reason': instance.reason,
      'contexts': instance.contexts,
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
