import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_image_dto.freezed.dart';

part 'character_image_dto.g.dart';

@freezed
class CharacterImageDto with _$CharacterImageDto {
  const factory CharacterImageDto({
    @JsonKey(name: 'large') String? large,
    @JsonKey(name: 'medium') String? medium,
  }) = _CharacterImageDto;

  factory CharacterImageDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterImageDtoFromJson(json);
}
