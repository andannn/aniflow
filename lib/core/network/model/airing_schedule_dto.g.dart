// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airing_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiringScheduleDtoImpl _$$AiringScheduleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AiringScheduleDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      mediaId: (json['mediaId'] as num?)?.toInt(),
      airingAt: (json['airingAt'] as num?)?.toInt(),
      timeUntilAiring: (json['timeUntilAiring'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
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
