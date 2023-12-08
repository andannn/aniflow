import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/network/model/media_edge.dart';

class CharacterAndMediaConnection {
  final CharacterModel character;
  final MediaModel? media;
  final CharacterRole role;

  CharacterAndMediaConnection(
      {required this.character, this.media, required this.role});

  static CharacterAndMediaConnection fromDto(MediaEdge edge) {
    return CharacterAndMediaConnection(
      character: CharacterModel.fromDto(edge.characters.first),
      media: edge.media != null ? MediaModel.fromDto(edge.media!) : null,
      role: edge.characterRole,
    );
  }
}
