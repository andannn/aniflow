import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    @Default('') String id,
    @Default(CharacterRole.background) CharacterRole role,
    @Default('') String image,
    @Default('') String nameEnglish,
    @Default('') String nameNative,
  }) = _CharacterModel;

  static CharacterModel fromDatabaseEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      role: entity.role ?? CharacterRole.background,
      image: entity.image ?? '',
      nameEnglish: entity.nameEnglish ?? '',
      nameNative: entity.nameNative ?? '',
    );
  }
}
