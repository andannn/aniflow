import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_cover_image_dto.freezed.dart';

part 'media_cover_image_dto.g.dart';

@freezed
class MediaCoverImageDto with _$MediaCoverImageDto {
  const factory MediaCoverImageDto({
    @JsonKey(name: 'extraLarge') String? extraLarge,
    @JsonKey(name: 'large') String? large,
    @JsonKey(name: 'medium') String? medium,
    @JsonKey(name: 'color') String? color,
  }) = _MediaCoverImageDto;

  factory MediaCoverImageDto.fromJson(Map<String, dynamic> json) =>
      _$MediaCoverImageDtoFromJson(json);
}
