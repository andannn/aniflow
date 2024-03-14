// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaListEntityImpl _$$MediaListEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaListEntityImpl(
      id: json['media_list_id'] as String? ?? '',
      userId: json['media_list_user_id'] as String?,
      animeId: json['media_list_media_id'] as String?,
      status: $enumDecodeNullable(
          _$MediaListStatusEnumMap, json['media_list_status']),
      progress: json['media_list_progress'] as int?,
      progressVolumes: json['media_list_progress_volumes'] as int?,
      notes: json['media_list_notes'] as String?,
      startedAt: json['media_list_started_at'] as int?,
      completedAt: json['media_list_completed_at'] as int?,
      score: (json['media_list_score'] as num?)?.toDouble(),
      updatedAt: json['media_list_updatedAt'] as int?,
      repeat: json['media_list_repeat'] as int?,
      private: json['media_list_private'] as int?,
    );

Map<String, dynamic> _$$MediaListEntityImplToJson(
        _$MediaListEntityImpl instance) =>
    <String, dynamic>{
      'media_list_id': instance.id,
      'media_list_user_id': instance.userId,
      'media_list_media_id': instance.animeId,
      'media_list_status': instance.status,
      'media_list_progress': instance.progress,
      'media_list_progress_volumes': instance.progressVolumes,
      'media_list_notes': instance.notes,
      'media_list_started_at': instance.startedAt,
      'media_list_completed_at': instance.completedAt,
      'media_list_score': instance.score,
      'media_list_updatedAt': instance.updatedAt,
      'media_list_repeat': instance.repeat,
      'media_list_private': instance.private,
    };

const _$MediaListStatusEnumMap = {
  MediaListStatus.current: 'CURRENT',
  MediaListStatus.completed: 'COMPLETED',
  MediaListStatus.dropped: 'DROPPED',
  MediaListStatus.paused: 'PAUSED',
  MediaListStatus.planning: 'PLANNING',
};
