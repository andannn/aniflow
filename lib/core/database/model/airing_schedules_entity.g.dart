// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airing_schedules_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AiringSchedulesEntity _$$_AiringSchedulesEntityFromJson(
        Map<String, dynamic> json) =>
    _$_AiringSchedulesEntity(
      id: json['airing_schedules_id'] as String? ?? '',
      mediaId: json['airing_schedules_media_id'] as String? ?? '',
      airingAt: json['airing_schedules_airing_at'] as int?,
      timeUntilAiring: json['airing_schedules_time_until_airing'] as int?,
      episode: json['airing_schedules_episode'] as int?,
    );

Map<String, dynamic> _$$_AiringSchedulesEntityToJson(
        _$_AiringSchedulesEntity instance) =>
    <String, dynamic>{
      'airing_schedules_id': instance.id,
      'airing_schedules_media_id': instance.mediaId,
      'airing_schedules_airing_at': instance.airingAt,
      'airing_schedules_time_until_airing': instance.timeUntilAiring,
      'airing_schedules_episode': instance.episode,
    };
