// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['user_data_id'] as String? ?? '',
      name: json['user_data_name'] as String? ?? '',
      avatar: json['user_data_avatar_image'] as String? ?? '',
      bannerImage: json['user_data_banner_image'] as String?,
      profileColor: json['user_data_profile_color'] as String?,
      unreadNotificationCount:
          json['user_data_unread_notification_count'] as int?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'user_data_id': instance.id,
      'user_data_name': instance.name,
      'user_data_avatar_image': instance.avatar,
      'user_data_banner_image': instance.bannerImage,
      'user_data_profile_color': instance.profileColor,
      'user_data_unread_notification_count': instance.unreadNotificationCount,
    };
