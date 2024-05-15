// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_voice_actor_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVoiceActorStaticsDtoImpl _$$UserVoiceActorStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserVoiceActorStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      characterIds: (json['characterIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      voiceActor: json['voiceActor'] == null
          ? null
          : StaffDto.fromJson(json['voiceActor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserVoiceActorStaticsDtoImplToJson(
        _$UserVoiceActorStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'characterIds': instance.characterIds,
      'voiceActor': instance.voiceActor,
    };
