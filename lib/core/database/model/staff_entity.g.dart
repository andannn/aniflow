// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffEntityImpl _$$StaffEntityImplFromJson(Map<String, dynamic> json) =>
    _$StaffEntityImpl(
      id: json['staff_id'] as String? ?? '',
      image: json['staff_image'] as String?,
      name: json['staff_name'] as String?,
    );

Map<String, dynamic> _$$StaffEntityImplToJson(_$StaffEntityImpl instance) =>
    <String, dynamic>{
      'staff_id': instance.id,
      'staff_image': instance.image,
      'staff_name': instance.name,
    };
