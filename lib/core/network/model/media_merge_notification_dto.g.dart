// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_merge_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaMergeNotificationDtoImpl _$$MediaMergeNotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaMergeNotificationDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      mediaId: json['mediaId'] as String?,
      deletedMediaTitle: (json['deletedMediaTitle'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
      reason: json['reason'] as String?,
      context: json['context'] as String?,
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaMergeNotificationDtoImplToJson(
        _$MediaMergeNotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'mediaId': instance.mediaId,
      'deletedMediaTitle': instance.deletedMediaTitle,
      'createdAt': instance.createdAt,
      'reason': instance.reason,
      'context': instance.context,
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
