import 'package:aniflow/core/database_drift/aniflow_database.dart';
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
}
