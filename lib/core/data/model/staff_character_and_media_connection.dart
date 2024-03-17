import 'package:aniflow/core/common/definitions/character_role.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/network/model/media_edge.dart';

class CharacterAndMediaConnection {
  final CharacterModel character;
  final MediaModel? media;
  final CharacterRole role;

  CharacterAndMediaConnection(
      {required this.character, this.media, required this.role});

  @override
  String toString() => 'character: $character media: $media role: $role';

  static CharacterAndMediaConnection fromDto(MediaEdge edge) {
    return CharacterAndMediaConnection(
      character: edge.characters.first.toModel(),
      media: edge.media?.toModel(),
      role: edge.characterRole,
    );
  }
}
