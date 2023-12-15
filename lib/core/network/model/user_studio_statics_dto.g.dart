// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_studio_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStudioStaticsDtoImpl _$$UserStudioStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStudioStaticsDtoImpl(
      count: json['count'] as int?,
      meanScore: json['meanScore'] as int?,
      minutesWatched: json['minutesWatched'] as int?,
      chaptersRead: json['chaptersRead'] as int?,
      mediaIds:
          (json['mediaIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      studio: json['studio'] == null
          ? null
          : StudioDto.fromJson(json['studio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserStudioStaticsDtoImplToJson(
        _$UserStudioStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'studio': instance.studio,
    };
