// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatusStaticsDtoImpl _$$UserStatusStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatusStaticsDtoImpl(
      count: json['count'] as int?,
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: json['minutesWatched'] as int?,
      chaptersRead: json['chaptersRead'] as int?,
      mediaIds:
          (json['mediaIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
    );

Map<String, dynamic> _$$UserStatusStaticsDtoImplToJson(
        _$UserStatusStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
    };
