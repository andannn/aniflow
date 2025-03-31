// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_with_episodes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectWithEpisodesModelImpl _$$SubjectWithEpisodesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectWithEpisodesModelImpl(
      title: json['title'] as String,
      originalPageUrl: json['originalPageUrl'] as String,
      seasonNum: (json['seasonNum'] as num).toInt(),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubjectWithEpisodesModelImplToJson(
        _$SubjectWithEpisodesModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'originalPageUrl': instance.originalPageUrl,
      'seasonNum': instance.seasonNum,
      'episodes': instance.episodes,
    };
