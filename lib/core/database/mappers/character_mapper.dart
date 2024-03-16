import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';

extension CharacterMapper on CharacterDto {
   CharacterEntity toEntity() {
    return CharacterEntity(
      id: id.toString(),
      mediumImage: image!.medium,
      largeImage: image!.large,
      firstName: name?.first,
      middleName: name?.middle,
      lastName: name?.last,
      fullName: name?.full,
      nativeName: name?.native,
      description: description,
      gender: gender,
      age: age,
      bloodType: bloodType,
      siteUrl: siteUrl,
      favourites: favourites,
      isFavourite: isFavourite,
      dateOfBirth: dateOfBirth?.toDateTime()?.millisecondsSinceEpoch,
    );
  }
}
