// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadDtoImpl _$$ThreadDtoImplFromJson(Map<String, dynamic> json) =>
    _$ThreadDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String?,
      replyCommentId: (json['replyCommentId'] as num?)?.toInt(),
      replyCount: (json['replyCount'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      isLiked: (json['isLiked'] as num?)?.toInt(),
      repliedAt: (json['repliedAt'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
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
