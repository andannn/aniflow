import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    @Default('') String id,
    @Default('') String image,
    @Default('') String name,
  }) = _CharacterModel;

  static CharacterModel fromDatabaseEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      image: entity.image ?? '',
      name: entity.name ?? '',
    );
  }
}
