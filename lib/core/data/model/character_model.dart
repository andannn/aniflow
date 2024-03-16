import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/database/mappers/character_mapper.dart';
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
    return dto.toEntity().toModel();
  }
}
