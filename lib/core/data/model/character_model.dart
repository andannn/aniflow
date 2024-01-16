import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_related_media.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    @Default('') String id,
    @Default('') String largeImage,
    @Default('') String mediumImage,
    StaffCharacterName? name,
    String? description,
    String? gender,
    DateTime? dateOfBirth,
    String? age,
    String? bloodType,
    String? siteUrl,
    int? favourites,
    @Default(false) bool isFavourite,
    @Default([]) List<MediaModel> relatedMedias,
  }) = _CharacterModel;

  static CharacterModel fromDto(CharacterDto dto) {
    return CharacterModel.fromDatabaseEntity(CharacterEntity.fromDto(dto));
  }

  static CharacterModel fromDatabaseEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      mediumImage: entity.mediumImage ?? '',
      largeImage: entity.largeImage ?? '',
      name: StaffCharacterName(
        first: entity.firstName,
        middle: entity.middleName,
        last: entity.lastName,
        full: entity.fullName,
        native: entity.nativeName,
      ),
      description: entity.description,
      gender: entity.gender,
      dateOfBirth: entity.dateOfBirth != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.dateOfBirth!)
          : null,
      age: entity.age,
      bloodType: entity.bloodType,
      siteUrl: entity.siteUrl,
      favourites: entity.favourites,
      isFavourite: entity.isFavourite.toBoolean(),
    );
  }

  static CharacterModel fromDetail(CharacterAndRelatedMedia entity) {
    return fromDatabaseEntity(entity.character).copyWith(
      relatedMedias: entity.medias
          .map(
            (e) => MediaModel.fromDatabaseModel(e),
          )
          .toList(),
    );
  }
}
