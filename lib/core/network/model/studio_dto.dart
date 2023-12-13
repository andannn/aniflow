import 'package:freezed_annotation/freezed_annotation.dart';

part 'studio_dto.freezed.dart';

part 'studio_dto.g.dart';

@freezed
class StudioDto with _$StudioDto {
  factory StudioDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'siteUrl') String? siteUrl,
    @Default(false) @JsonKey(name: 'isAnimationStudio') bool isAnimationStudio,
    @Default(false) @JsonKey(name: 'isFavourite') bool isFavourite,
  }) = _StudioDto;

  factory StudioDto.fromJson(Map<String, dynamic> json) =>
      _$$StudioDtoImplFromJson(json);
}
