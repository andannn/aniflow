// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextActivityDtoImpl _$$TextActivityDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TextActivityDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : ActivityType.fromJson(json['type'] as String),
      replyCount: (json['replyCount'] as num?)?.toInt(),
      siteUrl: json['siteUrl'] as String?,
      isLocked: json['isLocked'] as bool?,
      isLiked: json['isLiked'] as bool?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      isPinned: json['isPinned'] as bool?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>?)
              ?.map((e) => ActivityReplyDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TextActivityDtoImplToJson(
        _$TextActivityDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
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
      'replies': instance.replies,
    };
