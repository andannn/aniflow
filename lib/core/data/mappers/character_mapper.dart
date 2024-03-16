import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/staff_mapper.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/database/relations/character_and_voice_actor_relation.dart';

extension CharacterMapper on CharacterEntity {
  CharacterModel toModel() {
    return CharacterModel(
      id: id,
      mediumImage: mediumImage ?? '',
      largeImage: largeImage ?? '',
      name: StaffCharacterName(
        first: firstName,
        middle: middleName,
        last: lastName,
        full: fullName,
        native: nativeName,
      ),
      description: description,
      gender: gender,
      dateOfBirth: dateOfBirth != null
          ? DateTime.fromMillisecondsSinceEpoch(dateOfBirth!)
          : null,
      age: age,
      bloodType: bloodType,
      siteUrl: siteUrl,
      favourites: favourites,
      isFavourite: isFavourite ?? false,
    );
  }
}

extension CharacterMapper2 on CharacterAndRelatedMediaRelation {
  CharacterModel toModel() {
    return character.toModel().copyWith(
          relatedMedias: medias.map((e) => e.toModel()).toList(),
        );
  }
}
extension CharacterMapper3 on CharacterAndVoiceActorRelation {
  CharacterAndVoiceActorModel toModel() {
    return CharacterAndVoiceActorModel(
        characterModel: characterEntity.toModel(),
        voiceActorModel: voiceActorEntity?.toModel(),
        role: CharacterRole.fromJson(characterRole),
        staffLanguage: StaffLanguage.fromJson(staffLanguage)
    );
  }
}
