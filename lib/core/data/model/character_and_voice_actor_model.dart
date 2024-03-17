import 'package:aniflow/core/common/definitions/character_role.dart';
import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';

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
}
