import 'package:anime_tracker/core/data/model/character_model.dart';
import 'package:anime_tracker/core/data/model/staff_model.dart';
import 'package:anime_tracker/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:anime_tracker/core/database/model/staff_entity.dart';

class CharacterAndVoiceActorModel {
  CharacterAndVoiceActorModel(
      {required this.characterModel, required this.voiceActorModel});

  final CharacterModel characterModel;
  final StaffModel voiceActorModel;

  static CharacterAndVoiceActorModel fromDatabaseEntity(
      CharacterAndVoiceActorRelation entity) {
    return CharacterAndVoiceActorModel(
      characterModel: CharacterModel.fromDatabaseEntity(
        entity.characterEntity,
      ),
      voiceActorModel: StaffModel.fromDatabaseEntity(
        entity.voiceActorEntity ?? StaffEntity(),
      ),
    );
  }
}
