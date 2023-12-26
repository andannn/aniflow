// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_length_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLengthStaticsDtoImpl _$$UserLengthStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLengthStaticsDtoImpl(
      count: json['count'] as int?,
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: json['minutesWatched'] as int?,
      chaptersRead: json['chaptersRead'] as int?,
      mediaIds:
          (json['mediaIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      score: json['score'] as int?,
    );

Map<String, dynamic> _$$UserLengthStaticsDtoImplToJson(
        _$UserLengthStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'score': instance.score,
    };
