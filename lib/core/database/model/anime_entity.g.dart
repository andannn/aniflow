// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimeEntity _$$_AnimeEntityFromJson(Map<String, dynamic> json) =>
    _$_AnimeEntity(
      id: json['id'] as String? ?? '',
      englishTitle: json['english_title'] as String? ?? '',
      romajiTitle: json['romaji_title'] as String? ?? '',
      nativeTitle: json['native_title'] as String? ?? '',
      coverImage: json['cover_image'] as String? ?? '',
      coverImageColor: json['cover_image_color'] as String? ?? '',
      description: json['description'] as String?,
      source: $enumDecodeNullable(_$AnimeSourceEnumMap, json['source']) ??
          AnimeSource.other,
      bannerImage: json['banner_image'] as String?,
      averageScore: json['average_score'] as int?,
      trending: json['trending'] as int?,
      favourites: json['favourites'] as int?,
      trailerId: json['trailer_id'] as String?,
      trailerSite: json['trailer_site'] as String?,
      episodes: json['episodes'] as int?,
      seasonYear: json['season_year'] as int?,
      season: json['season'] as String?,
      trailerThumbnail: json['trailer_thumbnail'] as String?,
    );

Map<String, dynamic> _$$_AnimeEntityToJson(_$_AnimeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english_title': instance.englishTitle,
      'romaji_title': instance.romajiTitle,
      'native_title': instance.nativeTitle,
      'cover_image': instance.coverImage,
      'cover_image_color': instance.coverImageColor,
      'description': instance.description,
      'source': _$AnimeSourceEnumMap[instance.source]!,
      'banner_image': instance.bannerImage,
      'average_score': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'trailer_id': instance.trailerId,
      'trailer_site': instance.trailerSite,
      'episodes': instance.episodes,
      'season_year': instance.seasonYear,
      'season': instance.season,
      'trailer_thumbnail': instance.trailerThumbnail,
    };

const _$AnimeSourceEnumMap = {
  AnimeSource.original: 'ORIGINAL',
  AnimeSource.manga: 'MANGA',
  AnimeSource.lightNovel: 'LIGHT_NOVEL',
  AnimeSource.visualNovel: 'VISUAL_NOVEL',
  AnimeSource.videoGame: 'VIDEO_GAME',
  AnimeSource.other: 'OTHER',
};
