
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_dto.freezed.dart';

part 'trailer_dto.g.dart';

@freezed
class TrailerDto with _$TrailerDto {
  factory TrailerDto({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'site') String site,
    @Default('') @JsonKey(name: 'thumbnail') String thumbnail,
  }) = _TrailerDto;

  factory TrailerDto.fromJson(Map<String, dynamic> json) =>
      _$$_TrailerDtoFromJson(json);
}
