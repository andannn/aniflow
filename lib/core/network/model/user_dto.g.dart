// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      avatar: (json['avatar'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      bannerImage: json['bannerImage'] as String? ?? '',
      unreadNotificationCount:
          (json['unreadNotificationCount'] as num?)?.toInt() ?? 0,
      siteUrl: json['siteUrl'] as String?,
      options: json['options'] == null
          ? null
          : UserOptions.fromJson(json['options'] as Map<String, dynamic>),
      mediaListOptions: json['mediaListOptions'] == null
          ? null
          : MediaListOptionDto.fromJson(
              json['mediaListOptions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'bannerImage': instance.bannerImage,
      'unreadNotificationCount': instance.unreadNotificationCount,
      'siteUrl': instance.siteUrl,
      'options': instance.options,
      'mediaListOptions': instance.mediaListOptions,
    };
