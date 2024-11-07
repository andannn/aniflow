import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_dto.freezed.dart';
part 'track_dto.g.dart';

@freezed
class TrackDto with _$TrackDto {
  const factory TrackDto({
    @Default("") String file,
    @Default("") String label,
    @Default("") String kind,
    @Default(false) @JsonKey(name: "default") bool isDefault,
}) = _TrackDto;

  factory TrackDto.fromJson(Map<String, dynamic> json) =>
      _$TrackDtoFromJson(json);
}
