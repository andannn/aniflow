// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterEntityImpl _$$CharacterEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterEntityImpl(
      id: json['character_id'] as String? ?? '',
      image: json['character_image'] as String? ?? '',
      firstName: json['character_first_name'] as String?,
      middleName: json['character_middle_name'] as String?,
      lastName: json['character_last_name'] as String?,
      fullName: json['character_full_name'] as String?,
      nativeName: json['character_native_name'] as String?,
      description: json['character_description'] as String?,
      gender: json['character_gender'] as String?,
      dateOfBirth: json['character_dateOfBirth'] as int?,
      age: json['character_age'] as String?,
      bloodType: json['character_blood_type'] as String?,
      siteUrl: json['character_site_url'] as String?,
      favourites: json['character_favourites'] as int?,
      isFavourite: json['character_is_favourite'] as int?,
    );

Map<String, dynamic> _$$CharacterEntityImplToJson(
        _$CharacterEntityImpl instance) =>
    <String, dynamic>{
      'character_id': instance.id,
      'character_image': instance.image,
      'character_first_name': instance.firstName,
      'character_middle_name': instance.middleName,
      'character_last_name': instance.lastName,
      'character_full_name': instance.fullName,
      'character_native_name': instance.nativeName,
      'character_description': instance.description,
      'character_gender': instance.gender,
      'character_dateOfBirth': instance.dateOfBirth,
      'character_age': instance.age,
      'character_blood_type': instance.bloodType,
      'character_site_url': instance.siteUrl,
      'character_favourites': instance.favourites,
      'character_is_favourite': instance.isFavourite,
    };
