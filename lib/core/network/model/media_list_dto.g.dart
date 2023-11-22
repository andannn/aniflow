// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaListDtoImpl _$$MediaListDtoImplFromJson(Map<String, dynamic> json) =>
    _$MediaListDtoImpl(
      id: json['id'] as int? ?? -1,
      userId: json['userId'] as int? ?? -1,
      score: json['score'] as int?,
      status: $enumDecodeNullable(_$MediaListStatusEnumMap, json['status']),
      progress: json['progress'] as int? ?? -1,
      progressVolumes: json['progressVolumes'] as int? ?? -1,
      notes: json['notes'] as String?,
      updatedAt: json['updatedAt'] as int? ?? -1,
      startedAt: json['startedAt'] == null
          ? null
          : FuzzyDateDto.fromJson(json['startedAt'] as Map<String, dynamic>),
      completedAt: json['completedAt'] == null
          ? null
          : FuzzyDateDto.fromJson(json['completedAt'] as Map<String, dynamic>),
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaListDtoImplToJson(_$MediaListDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'score': instance.score,
      'status': _$MediaListStatusEnumMap[instance.status],
      'progress': instance.progress,
      'progressVolumes': instance.progressVolumes,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt,
      'startedAt': instance.startedAt,
      'completedAt': instance.completedAt,
      'media': instance.media,
    };

const _$MediaListStatusEnumMap = {
  MediaListStatus.current: 'CURRENT',
  MediaListStatus.completed: 'COMPLETED',
  MediaListStatus.dropped: 'DROPPED',
  MediaListStatus.paused: 'PAUSED',
  MediaListStatus.planning: 'PLANNING',
};
