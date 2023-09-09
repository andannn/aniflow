// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataEntity _$$_UserDataEntityFromJson(Map<String, dynamic> json) =>
    _$_UserDataEntity(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      avatar: json['avatar_image'] as String? ?? '',
      bannerImage: json['banner_image'] as String?,
    );

Map<String, dynamic> _$$_UserDataEntityToJson(_$_UserDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_image': instance.avatar,
      'banner_image': instance.bannerImage,
    };
