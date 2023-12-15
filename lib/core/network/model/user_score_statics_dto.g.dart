// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_score_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserScoreStaticsDtoImpl _$$UserScoreStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserScoreStaticsDtoImpl(
      count: json['count'] as int?,
      meanScore: json['meanScore'] as int?,
      minutesWatched: json['minutesWatched'] as int?,
      chaptersRead: json['chaptersRead'] as int?,
      mediaIds:
          (json['mediaIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      score: json['score'] as int?,
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
