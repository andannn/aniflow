import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_actor_entity.freezed.dart';

part 'voice_actor_entity.g.dart';

@freezed
class VoiceActorEntity with _$VoiceActorEntity {
  factory VoiceActorEntity({
    @Default('') @JsonKey(name: VoiceActorColumns.id) String id,
    @JsonKey(name: VoiceActorColumns.image) String? image,
    @JsonKey(name: VoiceActorColumns.nameEnglish) String? nameEnglish,
    @JsonKey(name: VoiceActorColumns.nameNative) String? nameNative,
  }) = _VoiceActorEntity;

  factory VoiceActorEntity.fromJson(Map<String, dynamic> json) =>
      _$$_VoiceActorEntityFromJson(json);


  static VoiceActorEntity? fromNetworkModel(
      CharacterEdge e) {
    if (e.voiceActors.isEmpty) {
      return null;
    }

    return VoiceActorEntity(
      id: e.voiceActors[0].id.toString(),
      image: e.voiceActors[0].image['large'],
      nameNative: e.voiceActors[0].name['native'],
      nameEnglish: e.voiceActors[0].name['full']!,
    );
  }
}
