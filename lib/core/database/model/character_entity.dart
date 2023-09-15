import 'package:anime_tracker/core/database/anime_dao.dart';
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
    @Default('') @JsonKey(name: CharacterColumns.image) String image,
    @Default('')
    @JsonKey(name: CharacterColumns.nameEnglish)
    String nameEnglish,
    @Default('') @JsonKey(name: CharacterColumns.nameNative) String nameNative,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterEntityFromJson(json);
}
