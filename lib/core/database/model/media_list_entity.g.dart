// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaListEntity _$$_MediaListEntityFromJson(Map<String, dynamic> json) =>
    _$_MediaListEntity(
      id: json['media_list_id'] as String? ?? '',
      userId: json['media_list_user_id'] as String?,
      animeId: json['media_list_media_id'] as String?,
      status: $enumDecodeNullable(
          _$MediaListStatusEnumMap, json['media_list_status']),
      progress: json['media_list_progress'] as int?,
      score: json['media_list_score'] as int?,
      updatedAt: json['media_list_updatedAt'] as int?,
    );

Map<String, dynamic> _$$_MediaListEntityToJson(_$_MediaListEntity instance) =>
    <String, dynamic>{
      'media_list_id': instance.id,
      'media_list_user_id': instance.userId,
      'media_list_media_id': instance.animeId,
      'media_list_status': _$MediaListStatusEnumMap[instance.status],
      'media_list_progress': instance.progress,
      'media_list_score': instance.score,
      'media_list_updatedAt': instance.updatedAt,
    };

const _$MediaListStatusEnumMap = {
  MediaListStatus.current: 'CURRENT',
  MediaListStatus.completed: 'COMPLETED',
  MediaListStatus.dropped: 'DROPPED',
  MediaListStatus.paused: 'PAUSED',
  MediaListStatus.planning: 'PLANNING',
};
