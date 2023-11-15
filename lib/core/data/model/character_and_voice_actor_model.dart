import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';

class CharacterAndVoiceActorModel {
  CharacterAndVoiceActorModel({
    required this.characterModel,
    this.voiceActorModel,
    this.role,
    this.staffLanguage,
  });

  final CharacterModel characterModel;
  final StaffModel? voiceActorModel;
  final CharacterRole? role;
  final StaffLanguage? staffLanguage;

  static CharacterAndVoiceActorModel fromDatabaseEntity(
      CharacterAndVoiceActorRelationEntity entity) {
    return CharacterAndVoiceActorModel(
      characterModel: CharacterModel.fromDatabaseEntity(
        entity.characterEntity,
      ),
      voiceActorModel: entity.voiceActorEntity == null
          ? null
          : StaffModel.fromDatabaseEntity(entity.voiceActorEntity!),
      role: entity.role,
      staffLanguage: entity.language,
    );
  }
}
