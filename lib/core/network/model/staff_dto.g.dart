// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffDtoImpl _$$StaffDtoImplFromJson(Map<String, dynamic> json) =>
    _$StaffDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      image: json['image'] == null
          ? null
          : StaffImageDto.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StaffCharacterName.fromJson(json['name'] as Map<String, dynamic>),
      description: json['description'] as String?,
      gender: json['gender'] as String?,
      siteUrl: json['siteUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : FuzzyDateDto.fromJson(json['dateOfBirth'] as Map<String, dynamic>),
      dateOfDeath: json['dateOfDeath'] == null
          ? null
          : FuzzyDateDto.fromJson(json['dateOfDeath'] as Map<String, dynamic>),
      age: (json['age'] as num?)?.toInt(),
      isFavourite: json['isFavourite'] as bool? ?? false,
      yearsActive: (json['yearsActive'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      homeTown: json['homeTown'] as String?,
      bloodType: json['bloodType'] as String?,
      characterMedia: json['characterMedia'] == null
          ? null
          : MediaConnection.fromJson(
              json['characterMedia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StaffDtoImplToJson(_$StaffDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'gender': instance.gender,
      'siteUrl': instance.siteUrl,
      'dateOfBirth': instance.dateOfBirth,
      'dateOfDeath': instance.dateOfDeath,
      'age': instance.age,
      'isFavourite': instance.isFavourite,
      'yearsActive': instance.yearsActive,
      'homeTown': instance.homeTown,
      'bloodType': instance.bloodType,
      'characterMedia': instance.characterMedia,
    };
