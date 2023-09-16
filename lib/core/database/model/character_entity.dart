import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';

part 'character_entity.g.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  factory CharacterEntity({
    @Default('') @JsonKey(name: CharacterColumns.id) String id,
    @Default('')
    @JsonKey(name: CharacterColumns.voiceActorId)
    String voiceActorId,
    @Default('') @JsonKey(name: CharacterColumns.image) String? image,
    @JsonKey(name: CharacterColumns.nameEnglish)
    String? nameEnglish,
    @JsonKey(name: CharacterColumns.nameNative) String? nameNative,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterEntityFromJson(json);

  static CharacterEntity fromNetworkModel(CharacterEdge e) {
    return CharacterEntity(
      id: e.characterEdge!.id.toString(),
      voiceActorId: e.voiceActors[0].id.toString(),
      image: e.characterEdge!.image['medium'],
      nameNative: e.characterEdge!.name['native'],
      nameEnglish: e.characterEdge!.name['full'],
    );
  }
}
