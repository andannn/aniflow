import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_entity.freezed.dart';

part 'character_entity.g.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  factory CharacterEntity({
    @Default('') @JsonKey(name: CharacterColumns.id) String id,
    @Default('') @JsonKey(name: CharacterColumns.image) String? image,
    @JsonKey(name: CharacterColumns.firstName) String? firstName,
    @JsonKey(name: CharacterColumns.middleName) String? middleName,
    @JsonKey(name: CharacterColumns.lastName) String? lastName,
    @JsonKey(name: CharacterColumns.fullName) String? fullName,
    @JsonKey(name: CharacterColumns.nativeName) String? nativeName,
    @JsonKey(name: CharacterColumns.description) String? description,
    @JsonKey(name: CharacterColumns.gender) String? gender,
    @JsonKey(name: CharacterColumns.dateOfBirth) int? dateOfBirth,
    @JsonKey(name: CharacterColumns.age) String? age,
    @JsonKey(name: CharacterColumns.bloodType) String? bloodType,
    @JsonKey(name: CharacterColumns.siteUrl) String? siteUrl,
    @JsonKey(name: CharacterColumns.favourites) int? favourites,
    @JsonKey(name: CharacterColumns.isFavourite) int? isFavourite,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$$CharacterEntityImplFromJson(json);

  static CharacterEntity fromNetworkModel(CharacterEdge e) {
    return fromDto(e.characterNode!);
  }

  static CharacterEntity fromDto(CharacterDto e) {
    return CharacterEntity(
      id: e.id.toString(),
      image: e.image['large'],
      firstName: e.name?.first,
      middleName: e.name?.middle,
      lastName: e.name?.last,
      fullName: e.name?.full,
      nativeName: e.name?.native,
      description: e.description,
      gender: e.gender,
      age: e.age,
      bloodType: e.bloodType,
      siteUrl: e.siteUrl,
      favourites: e.favourites,
      isFavourite: e.isFavourite.toInteger(),
      dateOfBirth: e.dateOfBirth.toDateTime()?.millisecondsSinceEpoch,
    );
  }
}
