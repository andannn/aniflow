// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_format_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFormatStaticsDtoImpl _$$UserFormatStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserFormatStaticsDtoImpl(
      count: json['count'] as int?,
      meanScore: json['meanScore'] as int?,
      minutesWatched: json['minutesWatched'] as int?,
      chaptersRead: json['chaptersRead'] as int?,
      mediaIds:
          (json['mediaIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      status: $enumDecodeNullable(_$MediaListStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UserFormatStaticsDtoImplToJson(
        _$UserFormatStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'status': _$MediaListStatusEnumMap[instance.status],
    };

const _$MediaListStatusEnumMap = {
  MediaListStatus.current: 'CURRENT',
  MediaListStatus.completed: 'COMPLETED',
  MediaListStatus.dropped: 'DROPPED',
  MediaListStatus.paused: 'PAUSED',
  MediaListStatus.planning: 'PLANNING',
};
