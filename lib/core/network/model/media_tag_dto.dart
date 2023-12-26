import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_tag_dto.freezed.dart';

part 'media_tag_dto.g.dart';

@freezed
class MediaTagDto with _$MediaTagDto {
  const factory MediaTagDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'rank') String? rank,
  }) = _MediaTagDto;

  factory MediaTagDto.fromJson(Map<String, dynamic> json) =>
      _$MediaTagDtoFromJson(json);
}