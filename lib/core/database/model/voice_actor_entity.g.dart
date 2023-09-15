// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_actor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VoiceActorEntity _$$_VoiceActorEntityFromJson(Map<String, dynamic> json) =>
    _$_VoiceActorEntity(
      id: json['voice_actor_id'] as String? ?? '',
      image: json['voice_actor_image'] as String? ?? '',
      nameEnglish: json['voice_actor_name_english'] as String? ?? '',
      nameNative: json['voice_actor_name_native'] as String? ?? '',
    );

Map<String, dynamic> _$$_VoiceActorEntityToJson(_$_VoiceActorEntity instance) =>
    <String, dynamic>{
      'voice_actor_id': instance.id,
      'voice_actor_image': instance.image,
      'voice_actor_name_english': instance.nameEnglish,
      'voice_actor_name_native': instance.nameNative,
    };
