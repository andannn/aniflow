// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['user_data_id'] as String? ?? '',
      name: json['user_data_name'] as String? ?? '',
      avatar: json['user_data_avatar_image'] as String? ?? '',
      bannerImage: json['user_data_banner_image'] as String?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'user_data_id': instance.id,
      'user_data_name': instance.name,
      'user_data_avatar_image': instance.avatar,
      'user_data_banner_image': instance.bannerImage,
    };
