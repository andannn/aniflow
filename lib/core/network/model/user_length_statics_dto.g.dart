// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_length_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLengthStaticsDtoImpl _$$UserLengthStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLengthStaticsDtoImpl(
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
