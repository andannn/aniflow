import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_dto.freezed.dart';

part 'staff_dto.g.dart';

@freezed
class StaffDto with _$StaffDto {
  factory StaffDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default({}) @JsonKey(name: 'image') Map<String, String?> image,
    @Default({}) @JsonKey(name: 'name') Map<String, String?> name,
  }) = _StaffDto;

  factory StaffDto.fromJson(Map<String, dynamic> json) =>
      _$$StaffDtoImplFromJson(json);
}
