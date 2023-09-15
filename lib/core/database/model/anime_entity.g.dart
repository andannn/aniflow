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
      description: json['description'] as String? ?? '',
      source: json['source'] as String? ?? '',
      bannerImage: json['banner_image'] as String? ?? '',
      averageScore: json['average_score'] as int? ?? -1,
      trending: json['trending'] as int? ?? -1,
      favourites: json['favourites'] as int? ?? -1,
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
      'source': instance.source,
      'banner_image': instance.bannerImage,
      'average_score': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
    };
