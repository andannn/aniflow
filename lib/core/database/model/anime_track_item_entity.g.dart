// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_track_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimeTrackItemEntity _$$_AnimeTrackItemEntityFromJson(
        Map<String, dynamic> json) =>
    _$_AnimeTrackItemEntity(
      id: json['media_list_id'] as String? ?? '',
      userId: json['user_id'] as String?,
      animeId: json['anime_id'] as String?,
      status: $enumDecodeNullable(
          _$AnimeListStatusEnumMap, json['anime_list_status']),
      progress: json['anime_list_progress'] as int?,
      score: json['score'] as int?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$$_AnimeTrackItemEntityToJson(
        _$_AnimeTrackItemEntity instance) =>
    <String, dynamic>{
      'media_list_id': instance.id,
      'user_id': instance.userId,
      'anime_id': instance.animeId,
      'anime_list_status': _$AnimeListStatusEnumMap[instance.status],
      'anime_list_progress': instance.progress,
      'score': instance.score,
      'updatedAt': instance.updatedAt,
    };

const _$AnimeListStatusEnumMap = {
  AnimeListStatus.current: 'CURRENT',
  AnimeListStatus.completed: 'COMPLETED',
  AnimeListStatus.dropped: 'DROPPED',
  AnimeListStatus.paused: 'PAUSED',
  AnimeListStatus.planning: 'PLANNING',
};
