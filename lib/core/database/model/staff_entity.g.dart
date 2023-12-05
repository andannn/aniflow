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
      description: json['staff_description'] as String?,
      gender: json['staff_gender'] as String?,
      siteUrl: json['staff_site_url'] as String?,
      dateOfBirth: json['staff_date_of_birth'] as int?,
      dateOfDeath: json['staff_date_of_death'] as int?,
      age: json['staff_age'] as int?,
      isFavourite: json['staff_is_favourite'] as int?,
      yearsActive: json['staff_years_active'] as String?,
      homeTown: json['staff_home_town'] as String?,
      bloodType: json['staff_blood_type'] as String?,
    );

Map<String, dynamic> _$$StaffEntityImplToJson(_$StaffEntityImpl instance) =>
    <String, dynamic>{
      'staff_id': instance.id,
      'staff_image': instance.image,
      'staff_name': instance.name,
      'staff_description': instance.description,
      'staff_gender': instance.gender,
      'staff_site_url': instance.siteUrl,
      'staff_date_of_birth': instance.dateOfBirth,
      'staff_date_of_death': instance.dateOfDeath,
      'staff_age': instance.age,
      'staff_is_favourite': instance.isFavourite,
      'staff_years_active': instance.yearsActive,
      'staff_home_town': instance.homeTown,
      'staff_blood_type': instance.bloodType,
    };
