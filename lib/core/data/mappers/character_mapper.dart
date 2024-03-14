import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';

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
