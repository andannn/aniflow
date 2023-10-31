// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivityEntity _$$_ActivityEntityFromJson(Map<String, dynamic> json) =>
    _$_ActivityEntity(
      id: json['activity_id'] as String? ?? '',
      userId: json['activity_userId'] as String? ?? '',
      text: json['activity_text'] as String?,
      status: json['activity_status'] as String?,
      progress: json['activity_progress'] as String?,
      type: json['activity_type'] as String?,
      replyCount: json['activity_replyCount'] as int?,
      siteUrl: json['activity_siteUrl'] as String?,
      isLocked: json['activity_isLocked'] as bool?,
      isLiked: json['activity_isLiked'] as bool?,
      likeCount: json['activity_likeCount'] as int?,
      isPinned: json['activity_isPinned'] as bool?,
      createdAt: json['activity_createdAt'] as int?,
    );

Map<String, dynamic> _$$_ActivityEntityToJson(_$_ActivityEntity instance) =>
    <String, dynamic>{
      'activity_id': instance.id,
      'activity_userId': instance.userId,
      'activity_text': instance.text,
      'activity_status': instance.status,
      'activity_progress': instance.progress,
      'activity_type': instance.type,
      'activity_replyCount': instance.replyCount,
      'activity_siteUrl': instance.siteUrl,
      'activity_isLocked': instance.isLocked,
      'activity_isLiked': instance.isLiked,
      'activity_likeCount': instance.likeCount,
      'activity_isPinned': instance.isPinned,
      'activity_createdAt': instance.createdAt,
    };
