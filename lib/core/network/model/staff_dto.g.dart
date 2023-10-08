// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffDto _$$_StaffDtoFromJson(Map<String, dynamic> json) => _$_StaffDto(
      id: json['id'] as int? ?? -1,
      image: (json['image'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
      name: (json['name'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_StaffDtoToJson(_$_StaffDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
    };
