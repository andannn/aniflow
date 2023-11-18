import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';

class CharacterAndVoiceActorRelationEntity {
  final CharacterEntity characterEntity;
  final StaffEntity? voiceActorEntity;
  final StaffLanguage? language;
  final CharacterRole? role;

  const CharacterAndVoiceActorRelationEntity({
    required this.characterEntity,
    required this.voiceActorEntity,
    this.language,
    this.role,
  });
}
