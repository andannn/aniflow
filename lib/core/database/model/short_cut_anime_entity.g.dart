// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_cut_anime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShortcutAnimeEntity _$$_ShortcutAnimeEntityFromJson(
        Map<String, dynamic> json) =>
    _$_ShortcutAnimeEntity(
      id: json['id'] as String? ?? '',
      englishTitle: json['english_title'] as String? ?? '',
      romajiTitle: json['romaji_title'] as String? ?? '',
      nativeTitle: json['native_title'] as String? ?? '',
      coverImage: json['cover_image'] as String? ?? '',
      coverImageColor: json['cover_image_color'] as String? ?? '',
    );

Map<String, dynamic> _$$_ShortcutAnimeEntityToJson(
        _$_ShortcutAnimeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english_title': instance.englishTitle,
      'romaji_title': instance.romajiTitle,
      'native_title': instance.nativeTitle,
      'cover_image': instance.coverImage,
      'cover_image_color': instance.coverImageColor,
    };
