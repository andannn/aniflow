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
      description: json['description'] as String?,
      source: $enumDecodeNullable(_$AnimeSourceEnumMap, json['source']) ??
          AnimeSource.other,
      episodes: json['episodes'] as int?,
      seasonYear: json['seasonYear'] as int?,
      season: json['season'] as String?,
      hashtag: json['hashtag'] as String? ?? '',
      bannerImage: json['bannerImage'] as String?,
      averageScore: json['averageScore'] as int?,
      trending: json['trending'] as int?,
      favourites: json['favourites'] as int?,
      trailer: json['trailer'] == null
          ? null
          : TrailerDto.fromJson(json['trailer'] as Map<String, dynamic>),
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
      'source': _$AnimeSourceEnumMap[instance.source]!,
      'episodes': instance.episodes,
      'seasonYear': instance.seasonYear,
      'season': instance.season,
      'hashtag': instance.hashtag,
      'bannerImage': instance.bannerImage,
      'averageScore': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'trailer': instance.trailer,
      'characters': instance.characters,
    };

const _$AnimeSourceEnumMap = {
  AnimeSource.original: 'ORIGINAL',
  AnimeSource.manga: 'MANGA',
  AnimeSource.lightNovel: 'LIGHT_NOVEL',
  AnimeSource.visualNovel: 'VISUAL_NOVEL',
  AnimeSource.videoGame: 'VIDEO_GAME',
  AnimeSource.other: 'OTHER',
};