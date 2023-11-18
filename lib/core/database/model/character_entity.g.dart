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
      nameEnglish: json['character_name_english'] as String?,
      nameNative: json['character_name_native'] as String?,
    );

Map<String, dynamic> _$$CharacterEntityImplToJson(
        _$CharacterEntityImpl instance) =>
    <String, dynamic>{
      'character_id': instance.id,
      'character_image': instance.image,
      'character_name_english': instance.nameEnglish,
      'character_name_native': instance.nameNative,
    };
