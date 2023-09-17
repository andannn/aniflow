// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailAnimeDto _$$_DetailAnimeDtoFromJson(Map<String, dynamic> json) =>
    _$_DetailAnimeDto(
      id: json['id'] as int? ?? -1,
      title: json['title'] == null
          ? null
          : AnimeTitle.fromJson(json['title'] as Map<String, dynamic>),
      coverImage: (json['coverImage'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
      description: json['description'] as String? ?? '',
      source: json['source'] as String? ?? '',
      hashtag: json['hashtag'] as String? ?? '',
      bannerImage: json['bannerImage'] as String?,
      averageScore: json['averageScore'] as int?,
      trending: json['trending'] as int?,
      favourites: json['favourites'] as int?,
      characters: json['characters'] == null
          ? null
          : CharacterConnection.fromJson(
              json['characters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DetailAnimeDtoToJson(_$_DetailAnimeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverImage': instance.coverImage,
      'description': instance.description,
      'source': instance.source,
      'hashtag': instance.hashtag,
      'bannerImage': instance.bannerImage,
      'averageScore': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'characters': instance.characters,
    };
