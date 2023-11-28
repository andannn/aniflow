import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_related_media.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    @Default('') String id,
    @Default('') String image,
    @Default('') String name,
    String? description,
    String? gender,
    int? dateOfBirth,
    String? age,
    String? bloodType,
    String? siteUrl,
    int? favourites,
    @Default(false) bool isFavourite,
    @Default([]) List<MediaModel> relatedMedias,
  }) = _CharacterModel;

  static CharacterModel fromDatabaseEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      image: entity.image ?? '',
      name: entity.name ?? '',
      description: entity.description,
      gender: entity.gender,
      dateOfBirth: entity.dateOfBirth,
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
