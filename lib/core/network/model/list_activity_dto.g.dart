// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListActivityDtoImpl _$$ListActivityDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ListActivityDtoImpl(
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
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListActivityDtoImplToJson(
        _$ListActivityDtoImpl instance) =>
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
      'media': instance.media,
    };
