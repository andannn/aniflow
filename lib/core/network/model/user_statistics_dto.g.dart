// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStaticsDtoImpl _$$UserStaticsDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      standardDeviation: (json['standardDeviation'] as num?)?.toInt(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      episodesWatched: (json['episodesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      volumesRead: (json['volumesRead'] as num?)?.toInt(),
      formats: (json['formats'] as List<dynamic>?)
              ?.map((e) =>
                  UserFormatStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statuses: (json['statuses'] as List<dynamic>?)
              ?.map((e) =>
                  UserStatusStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      scores: (json['scores'] as List<dynamic>?)
              ?.map((e) =>
                  UserScoreStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lengths: (json['lengths'] as List<dynamic>?)
              ?.map((e) =>
                  UserLengthStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      releaseYears: (json['releaseYears'] as List<dynamic>?)
              ?.map((e) =>
                  UserReleaseYearStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) =>
                  UserGenreStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      countries: (json['countries'] as List<dynamic>?)
              ?.map((e) =>
                  UserCountryStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      staff: (json['staff'] as List<dynamic>?)
              ?.map((e) =>
                  UserStaffStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      studios: (json['studios'] as List<dynamic>?)
              ?.map((e) =>
                  UserStudioStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      voiceActors: (json['voiceActors'] as List<dynamic>?)
              ?.map((e) =>
                  UserVoiceActorStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags: (json['tags'] as List<dynamic>?)
              ?.map(
                  (e) => UserTagStaticsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserStaticsDtoImplToJson(
        _$UserStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'standardDeviation': instance.standardDeviation,
      'minutesWatched': instance.minutesWatched,
      'episodesWatched': instance.episodesWatched,
      'chaptersRead': instance.chaptersRead,
      'volumesRead': instance.volumesRead,
      'formats': instance.formats,
      'statuses': instance.statuses,
      'scores': instance.scores,
      'lengths': instance.lengths,
      'releaseYears': instance.releaseYears,
      'genres': instance.genres,
      'countries': instance.countries,
      'staff': instance.staff,
      'studios': instance.studios,
      'voiceActors': instance.voiceActors,
      'tags': instance.tags,
    };
