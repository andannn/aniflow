// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airing_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiringNotificationDtoImpl _$$AiringNotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AiringNotificationDtoImpl(
      id: json['id'] as int? ?? -1,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      animeId: json['animeId'] as int?,
      episode: json['episode'] as int?,
      contexts: (json['contexts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] as int?,
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AiringNotificationDtoImplToJson(
        _$AiringNotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'animeId': instance.animeId,
      'episode': instance.episode,
      'contexts': instance.contexts,
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
