// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffEntity _$$_StaffEntityFromJson(Map<String, dynamic> json) =>
    _$_StaffEntity(
      id: json['staff_id'] as String? ?? '',
      image: json['staff_image'] as String?,
      nameEnglish: json['staff_name_english'] as String?,
      nameNative: json['staff_name_native'] as String?,
    );

Map<String, dynamic> _$$_StaffEntityToJson(_$_StaffEntity instance) =>
    <String, dynamic>{
      'staff_id': instance.id,
      'staff_image': instance.image,
      'staff_name_english': instance.nameEnglish,
      'staff_name_native': instance.nameNative,
    };
