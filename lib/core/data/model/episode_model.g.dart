// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeModelImpl _$$EpisodeModelImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeModelImpl(
      url: json['url'] as String,
      title: json['title'] as String,
      episodeNum: (json['episodeNum'] as num).toInt(),
    );

Map<String, dynamic> _$$EpisodeModelImplToJson(_$EpisodeModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'episodeNum': instance.episodeNum,
    };
