// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_score_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserScoreStaticsDtoImpl _$$UserScoreStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserScoreStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserScoreStaticsDtoImplToJson(
        _$UserScoreStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'score': instance.score,
    };
