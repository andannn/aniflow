import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/voice_actor_entity.dart';

class CharacterAndVoiceActor {
  final CharacterEntity characterEntity;
  final VoiceActorEntity voiceActorEntity;

  CharacterAndVoiceActor(
      {required this.characterEntity, required this.voiceActorEntity});
}

class AnimeCharactersAndVoiceActors {
  final AnimeEntity animeEntity;
  final List<CharacterAndVoiceActor> characterAndVoiceActors;

  AnimeCharactersAndVoiceActors(
      {required this.animeEntity, required this.characterAndVoiceActors});
}
