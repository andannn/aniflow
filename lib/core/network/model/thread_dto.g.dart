// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadDtoImpl _$$ThreadDtoImplFromJson(Map<String, dynamic> json) =>
    _$ThreadDtoImpl(
      id: json['id'] as int? ?? -1,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String?,
      replyCommentId: json['replyCommentId'] as int?,
      replyCount: json['replyCount'] as int?,
      viewCount: json['viewCount'] as int?,
      likeCount: json['likeCount'] as int?,
      isLiked: json['isLiked'] as int?,
      repliedAt: json['repliedAt'] as int?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      siteUrl: json['siteUrl'] as String?,
      isLocked: json['isLocked'] as bool?,
    );

Map<String, dynamic> _$$ThreadDtoImplToJson(_$ThreadDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'body': instance.body,
      'replyCommentId': instance.replyCommentId,
      'replyCount': instance.replyCount,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'repliedAt': instance.repliedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'siteUrl': instance.siteUrl,
      'isLocked': instance.isLocked,
    };
