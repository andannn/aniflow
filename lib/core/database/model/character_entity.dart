import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';

part 'character_entity.g.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  factory CharacterEntity({
    @Default('') @JsonKey(name: CharacterColumns.id) String id,
    @Default('') @JsonKey(name: CharacterColumns.image) String? image,
    @JsonKey(name: CharacterColumns.name) String? name,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$$CharacterEntityImplFromJson(json);

  static CharacterEntity fromNetworkModel(CharacterEdge e) {
    return CharacterEntity(
      id: e.characterNode!.id.toString(),
      image: e.characterNode!.image['large'],
      name: e.characterNode!.name['userPreferred'],
    );
  }

  static CharacterEntity fromDto(CharacterDto e) {
    return CharacterEntity(
      id: e.id.toString(),
      image: e.image['large'],
      name: e.name['userPreferred'],
    );
  }
}
