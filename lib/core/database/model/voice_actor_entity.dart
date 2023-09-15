import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_actor_entity.freezed.dart';

part 'voice_actor_entity.g.dart';

@freezed
class VoiceActorEntity with _$VoiceActorEntity {
  factory VoiceActorEntity({
    @Default('') @JsonKey(name: VoiceActorColumns.id) String id,
    @Default('') @JsonKey(name: VoiceActorColumns.image) String image,
    @Default('') @JsonKey(name: VoiceActorColumns.nameEnglish) String nameEnglish,
    @Default('') @JsonKey(name: VoiceActorColumns.nameNative) String nameNative,
  }) = _VoiceActorEntity;

  factory VoiceActorEntity.fromJson(Map<String, dynamic> json) =>
      _$$_VoiceActorEntityFromJson(json);


  static VoiceActorEntity fromNetworkModel(
      CharacterEdge e) {
    return VoiceActorEntity(
      id: e.characterEdge!.id.toString(),
      image: e.characterEdge!.image['medium']!,
      nameNative: e.characterEdge!.name['native']!,
      nameEnglish: e.characterEdge!.name['full']!,
    );
  }
}
