// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airing_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiringScheduleDtoImpl _$$AiringScheduleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AiringScheduleDtoImpl(
      id: json['id'] as int? ?? -1,
      mediaId: json['mediaId'] as int?,
      airingAt: json['airingAt'] as int?,
      timeUntilAiring: json['timeUntilAiring'] as int?,
      episode: json['episode'] as int?,
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AiringScheduleDtoImplToJson(
        _$AiringScheduleDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaId': instance.mediaId,
      'airingAt': instance.airingAt,
      'timeUntilAiring': instance.timeUntilAiring,
      'episode': instance.episode,
      'media': instance.media,
    };
