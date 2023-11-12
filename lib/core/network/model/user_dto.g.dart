// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      avatar: (json['avatar'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      bannerImage: json['bannerImage'] as String? ?? '',
      options: json['options'] == null
          ? null
          : UserOptions.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'bannerImage': instance.bannerImage,
      'options': instance.options,
    };
