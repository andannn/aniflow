// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterDtoImpl _$$CharacterDtoImplFromJson(Map<String, dynamic> json) =>
    _$CharacterDtoImpl(
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

Map<String, dynamic> _$$CharacterDtoImplToJson(_$CharacterDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
    };
