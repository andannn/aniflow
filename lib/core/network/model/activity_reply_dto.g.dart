// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_reply_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityReplyDtoImpl _$$ActivityReplyDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityReplyDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      text: json['text'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ActivityReplyDtoImplToJson(
        _$ActivityReplyDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'likeCount': instance.likeCount,
      'text': instance.text,
      'user': instance.user,
      'isLiked': instance.isLiked,
      'createdAt': instance.createdAt,
    };
