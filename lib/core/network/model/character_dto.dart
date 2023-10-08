import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';

part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto {
  factory CharacterDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default({}) @JsonKey(name: 'image') Map<String, String?> image,
    @Default({}) @JsonKey(name: 'name') Map<String, String?> name,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDtoFromJson(json);
}
