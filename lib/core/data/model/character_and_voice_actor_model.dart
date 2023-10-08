import 'package:anime_tracker/core/data/model/character_model.dart';
import 'package:anime_tracker/core/data/model/staff_model.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_detail_info.dart';

class CharacterAndVoiceActorModel {
  CharacterAndVoiceActorModel(
      {required this.characterModel, required this.voiceActorModel});

  final CharacterModel characterModel;
  final StaffModel voiceActorModel;

  static CharacterAndVoiceActorModel fromDatabaseEntity(
      CharacterAndVoiceActor entity) {
    return CharacterAndVoiceActorModel(
      characterModel: CharacterModel.fromDatabaseEntity(
        entity.characterEntity,
      ),
      voiceActorModel: StaffModel.fromDatabaseEntity(
        entity.voiceActorEntity,
      ),
    );
  }
}
