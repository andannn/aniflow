// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_release_year_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserReleaseYearStaticsDtoImpl _$$UserReleaseYearStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserReleaseYearStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      releaseYear: (json['releaseYear'] as num?)?.toInt(),
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
