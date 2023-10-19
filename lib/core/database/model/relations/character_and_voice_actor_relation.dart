
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';

class CharacterAndVoiceActorRelation {
  final CharacterEntity characterEntity;
  final StaffEntity? voiceActorEntity;

  const CharacterAndVoiceActorRelation(
      {required this.characterEntity, required this.voiceActorEntity});
}
