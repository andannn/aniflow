import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/util/date_time_util.dart';

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
      dateOfBirth: dateOfBirth?.toDateTime(),
    );
  }
}

extension CharacterMapper2 on CharacterDto {
  CharacterAndRelatedMediaRelation toRelation() {
    return CharacterAndRelatedMediaRelation(
      character: toEntity(),
      medias: media?.edges
              .map((e) => e.media?.toEntity())
              .nonNulls
              .toList() ??
          [],
    );
  }
}
