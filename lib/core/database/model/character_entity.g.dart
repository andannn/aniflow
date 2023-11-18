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
      name: json['character_name'] as String?,
    );

Map<String, dynamic> _$$CharacterEntityImplToJson(
        _$CharacterEntityImpl instance) =>
    <String, dynamic>{
      'character_id': instance.id,
      'character_image': instance.image,
      'character_name': instance.name,
    };
