// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterEntity _$$_CharacterEntityFromJson(Map<String, dynamic> json) =>
    _$_CharacterEntity(
      id: json['character_id'] as String? ?? '',
      voiceActorId: json['character_voice_actor_id'] as String?,
      role: $enumDecodeNullable(_$CharacterRoleEnumMap, json['character_role']),
      image: json['character_image'] as String? ?? '',
      nameEnglish: json['character_name_english'] as String?,
      nameNative: json['character_name_native'] as String?,
    );

Map<String, dynamic> _$$_CharacterEntityToJson(_$_CharacterEntity instance) =>
    <String, dynamic>{
      'character_id': instance.id,
      'character_voice_actor_id': instance.voiceActorId,
      'character_role': _$CharacterRoleEnumMap[instance.role],
      'character_image': instance.image,
      'character_name_english': instance.nameEnglish,
      'character_name_native': instance.nameNative,
    };

const _$CharacterRoleEnumMap = {
  CharacterRole.main: 'MAIN',
  CharacterRole.supporting: 'SUPPORTING',
  CharacterRole.background: 'BACKGROUND',
};
