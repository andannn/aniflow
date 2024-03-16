import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/staff_mapper.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class CharacterAndVoiceActorRelation extends Equatable {
  final CharacterEntity characterEntity;
  final StaffEntity? voiceActorEntity;
  final String? staffLanguage;
  final String? characterRole;

  const CharacterAndVoiceActorRelation({
    required this.characterEntity,
    required this.voiceActorEntity,
    this.staffLanguage,
    this.characterRole,
  });

  @override
  List<Object?> get props =>
      [characterEntity, voiceActorEntity, staffLanguage, characterEntity];

  static CharacterAndVoiceActorModel fromDatabaseEntity(
      CharacterAndVoiceActorRelation entity) {
    return CharacterAndVoiceActorModel(
        characterModel: entity.characterEntity.toModel(),
        voiceActorModel: entity.voiceActorEntity?.toModel(),
        role: CharacterRole.fromJson(entity.characterRole),
        staffLanguage: StaffLanguage.fromJson(entity.staffLanguage)
    );
  }
}
