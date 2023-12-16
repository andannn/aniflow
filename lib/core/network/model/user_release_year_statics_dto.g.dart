// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_release_year_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserReleaseYearStaticsDtoImpl _$$UserReleaseYearStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserReleaseYearStaticsDtoImpl(
      count: json['count'] as int?,
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: json['minutesWatched'] as int?,
      chaptersRead: json['chaptersRead'] as int?,
      mediaIds:
          (json['mediaIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      releaseYear: json['releaseYear'] as int?,
    );

Map<String, dynamic> _$$UserReleaseYearStaticsDtoImplToJson(
        _$UserReleaseYearStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'releaseYear': instance.releaseYear,
    };
