// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_media_addition_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RelatedMediaAdditionNotificationDtoImpl
    _$$RelatedMediaAdditionNotificationDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$RelatedMediaAdditionNotificationDtoImpl(
          id: (json['id'] as num?)?.toInt() ?? -1,
          type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
          mediaId: (json['mediaId'] as num?)?.toInt(),
          context: json['context'] as String?,
          createdAt: (json['createdAt'] as num?)?.toInt(),
          media: json['media'] == null
              ? null
              : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RelatedMediaAdditionNotificationDtoImplToJson(
        _$RelatedMediaAdditionNotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'mediaId': instance.mediaId,
      'context': instance.context,
      'createdAt': instance.createdAt,
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
