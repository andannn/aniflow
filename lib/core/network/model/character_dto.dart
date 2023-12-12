import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_connection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';

part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto {
  factory CharacterDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default({}) @JsonKey(name: 'image') Map<String, String?> image,
    @JsonKey(name: 'name') StaffCharacterName? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'dateOfBirth') FuzzyDateDto? dateOfBirth,
    @JsonKey(name: 'age') String? age,
    @JsonKey(name: 'bloodType') String? bloodType,
    @JsonKey(name: 'siteUrl') String? siteUrl,
    @JsonKey(name: 'favourites') int? favourites,
    @Default(false) @JsonKey(name: 'isFavourite') bool isFavourite,
    @JsonKey(name: 'media') MediaConnection? media,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$$CharacterDtoImplFromJson(json);
}
