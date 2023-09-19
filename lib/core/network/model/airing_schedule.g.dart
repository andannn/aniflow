// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airing_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AiringSchedule _$$_AiringScheduleFromJson(Map<String, dynamic> json) =>
    _$_AiringSchedule(
      id: json['id'] as int? ?? -1,
      airingAt: json['airingAt'] as int?,
      timeUntilAiring: json['timeUntilAiring'] as int?,
      episode: json['episode'] as int?,
    );

Map<String, dynamic> _$$_AiringScheduleToJson(_$_AiringSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airingAt': instance.airingAt,
      'timeUntilAiring': instance.timeUntilAiring,
      'episode': instance.episode,
    };
