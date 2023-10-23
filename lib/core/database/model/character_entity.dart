import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';

part 'character_entity.g.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  factory CharacterEntity({
    @Default('') @JsonKey(name: CharacterColumns.id) String id,
    @JsonKey(name: CharacterColumns.voiceActorId)
    String? voiceActorId,
    @JsonKey(name: CharacterColumns.role) CharacterRole? role,
    @Default('') @JsonKey(name: CharacterColumns.image) String? image,
    @JsonKey(name: CharacterColumns.nameEnglish)
    String? nameEnglish,
    @JsonKey(name: CharacterColumns.nameNative) String? nameNative,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterEntityFromJson(json);

  static CharacterEntity fromNetworkModel(CharacterEdge e) {
    StaffDto? voiceActor;
    if (e.voiceActors.isNotEmpty) {
      voiceActor = e.voiceActors[0];
    }

    return CharacterEntity(
      id: e.characterNode!.id.toString(),
      voiceActorId: voiceActor?.id.toString(),
      role: e.role,
      image: e.characterNode!.image['large'],
      nameNative: e.characterNode!.name['native'],
      nameEnglish: e.characterNode!.name['full'],
    );
  }

  static CharacterEntity fromDto(CharacterDto e) {
    return CharacterEntity(
      id: e.id.toString(),
      image: e.image['large'],
      nameNative: e.name['native'],
      nameEnglish: e.name['full'],
    );
  }
}
