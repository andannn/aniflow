// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityEntityImpl _$$ActivityEntityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityEntityImpl(
      id: json['activity_id'] as String? ?? '',
      userId: json['activity_userId'] as String? ?? '',
      mediaId: json['activity_mediaId'] as String?,
      text: json['activity_text'] as String?,
      status: json['activity_status'] as String?,
      progress: json['activity_progress'] as String?,
      type: json['activity_type'] as String?,
      replyCount: json['activity_replyCount'] as int?,
      siteUrl: json['activity_siteUrl'] as String?,
      isLocked: json['activity_isLocked'] as int?,
      isLiked: json['activity_isLiked'] as int?,
      likeCount: json['activity_likeCount'] as int?,
      isPinned: json['activity_isPinned'] as int?,
      createdAt: json['activity_createdAt'] as int?,
    );

Map<String, dynamic> _$$ActivityEntityImplToJson(
        _$ActivityEntityImpl instance) =>
    <String, dynamic>{
      'activity_id': instance.id,
      'activity_userId': instance.userId,
      'activity_mediaId': instance.mediaId,
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
