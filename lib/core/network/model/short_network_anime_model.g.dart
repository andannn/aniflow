// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_network_anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShortNetworkAnime _$$_ShortNetworkAnimeFromJson(Map<String, dynamic> json) =>
    _$_ShortNetworkAnime(
      id: json['id'] as int? ?? -1,
      title: json['title'] == null
          ? null
          : AnimeTitle.fromJson(json['title'] as Map<String, dynamic>),
      coverImage: (json['coverImage'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_ShortNetworkAnimeToJson(
        _$_ShortNetworkAnime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverImage': instance.coverImage,
    };
