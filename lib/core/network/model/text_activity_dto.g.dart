// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextActivityDto _$$_TextActivityDtoFromJson(Map<String, dynamic> json) =>
    _$_TextActivityDto(
      id: json['id'] as int?,
      text: json['text'] as String?,
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

Map<String, dynamic> _$$_TextActivityDtoToJson(_$_TextActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'userId': instance.userId,
      'type': _$ActivityTypeEnumMap[instance.type],
      'replyCount': instance.replyCount,
      'siteUrl': instance.siteUrl,
      'isLocked': instance.isLocked,
      'isLiked': instance.isLiked,
      'likeCount': instance.likeCount,
      'isPinned': instance.isPinned,
      'createdAt': instance.createdAt,
      'user': instance.user,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.text: 'TEXT',
  ActivityType.animeList: 'ANIME_LIST',
  ActivityType.mangaList: 'MANGA_LIST',
  ActivityType.message: 'MESSAGE',
  ActivityType.mediaList: 'MEDIA_LIST',
};
