// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataDto _$$_UserDataDtoFromJson(Map<String, dynamic> json) =>
    _$_UserDataDto(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      avatar: (json['avatar'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      bannerImage: json['bannerImage'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserDataDtoToJson(_$_UserDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'bannerImage': instance.bannerImage,
    };
