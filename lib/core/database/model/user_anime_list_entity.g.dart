// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_anime_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAnimeListEntity _$$_UserAnimeListEntityFromJson(
        Map<String, dynamic> json) =>
    _$_UserAnimeListEntity(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String?,
      animeId: json['anime_id'] as String?,
      status: $enumDecodeNullable(_$AnimeListStatusEnumMap, json['status']),
      score: json['score'] as int?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$$_UserAnimeListEntityToJson(
        _$_UserAnimeListEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'anime_id': instance.animeId,
      'status': _$AnimeListStatusEnumMap[instance.status],
      'score': instance.score,
      'updatedAt': instance.updatedAt,
    };

const _$AnimeListStatusEnumMap = {
  AnimeListStatus.current: 'CURRENT',
  AnimeListStatus.completed: 'COMPLETED',
  AnimeListStatus.dropped: 'DROPPED',
};
