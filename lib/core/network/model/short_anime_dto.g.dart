// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShortcutAnimeDto _$$_ShortcutAnimeDtoFromJson(Map<String, dynamic> json) =>
    _$_ShortcutAnimeDto(
      id: json['id'] as int? ?? -1,
      title: json['title'] == null
          ? null
          : AnimeTitle.fromJson(json['title'] as Map<String, dynamic>),
      coverImage: (json['coverImage'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_ShortcutAnimeDtoToJson(_$_ShortcutAnimeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverImage': instance.coverImage,
    };
