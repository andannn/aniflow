// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListActivityDto _$$_ListActivityDtoFromJson(Map<String, dynamic> json) =>
    _$_ListActivityDto(
      id: json['id'] as int?,
      status: json['status'] as String?,
      progress: json['progress'] as String?,
      userId: json['userId'] as int?,
      type: json['type'] == null
          ? null
          : ActivityType.fromJson(json['type'] as String),
      replyCount: json['replyCount'] as int?,
      siteUrl: json['siteUrl'] as String?,
      isLocked: json['isLocked'] as bool?,
      isLiked: json['isLiked'] as bool?,
      likeCount: json['likeCount'] as int?,
      isPinned: json['isPinned'] as bool?,
      createdAt: json['createdAt'] as int?,
      user: json['user'] == null
          ? null
          : UserDataDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ListActivityDtoToJson(_$_ListActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'progress': instance.progress,
      'userId': instance.userId,
      'type': instance.type,
      'replyCount': instance.replyCount,
      'siteUrl': instance.siteUrl,
      'isLocked': instance.isLocked,
      'isLiked': instance.isLiked,
      'likeCount': instance.likeCount,
      'isPinned': instance.isPinned,
      'createdAt': instance.createdAt,
      'user': instance.user,
    };
