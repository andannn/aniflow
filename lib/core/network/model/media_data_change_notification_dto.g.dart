// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_data_change_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaDataChangeNotificationDtoImpl
    _$$MediaDataChangeNotificationDtoImplFromJson(Map<String, dynamic> json) =>
        _$MediaDataChangeNotificationDtoImpl(
          id: json['id'] as int? ?? -1,
          type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
          mediaId: json['mediaId'] as int?,
          context: json['context'] as String?,
          createdAt: json['createdAt'] as int?,
          reason: json['reason'] as String?,
          media: json['media'] == null
              ? null
              : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MediaDataChangeNotificationDtoImplToJson(
        _$MediaDataChangeNotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'mediaId': instance.mediaId,
      'context': instance.context,
      'createdAt': instance.createdAt,
      'reason': instance.reason,
      'media': instance.media,
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
