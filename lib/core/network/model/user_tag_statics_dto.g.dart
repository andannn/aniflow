// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tag_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTagStaticsDtoImpl _$$UserTagStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserTagStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      tag: json['tag'] == null
          ? null
          : MediaTagDto.fromJson(json['tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserTagStaticsDtoImplToJson(
        _$UserTagStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'tag': instance.tag,
    };
