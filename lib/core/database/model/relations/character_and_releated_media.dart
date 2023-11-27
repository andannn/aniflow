import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';

class CharacterAndRelatedMedia {
  CharacterAndRelatedMedia({required this.character, required this.medias});

  final CharacterEntity character;
  final List<MediaEntity> medias;
}
