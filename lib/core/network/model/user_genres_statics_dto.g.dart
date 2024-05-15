// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_genres_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserGenreStaticsDtoImpl _$$UserGenreStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserGenreStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      genre: json['genre'] as String?,
    );

Map<String, dynamic> _$$UserGenreStaticsDtoImplToJson(
        _$UserGenreStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'genre': instance.genre,
    };
