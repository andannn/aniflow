// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterDtoImpl _$$CharacterDtoImplFromJson(Map<String, dynamic> json) =>
    _$CharacterDtoImpl(
      id: json['id'] as int? ?? -1,
      image: json['image'] == null
          ? null
          : CharacterImageDto.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StaffCharacterName.fromJson(json['name'] as Map<String, dynamic>),
      description: json['description'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : FuzzyDateDto.fromJson(json['dateOfBirth'] as Map<String, dynamic>),
      age: json['age'] as String?,
      bloodType: json['bloodType'] as String?,
      siteUrl: json['siteUrl'] as String?,
      favourites: json['favourites'] as int?,
      isFavourite: json['isFavourite'] as bool? ?? false,
      media: json['media'] == null
          ? null
          : MediaConnection.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterDtoImplToJson(_$CharacterDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'age': instance.age,
      'bloodType': instance.bloodType,
      'siteUrl': instance.siteUrl,
      'favourites': instance.favourites,
      'isFavourite': instance.isFavourite,
      'media': instance.media,
    };
