import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/database/model/relations/character_and_related_media.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/relations/character_and_related_media_relation.dart';

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

