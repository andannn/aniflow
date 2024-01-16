import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_image_dto.freezed.dart';

part 'staff_image_dto.g.dart';

@freezed
class StaffImageDto with _$StaffImageDto {
  const factory StaffImageDto({
    @JsonKey(name: 'large') String? large,
    @JsonKey(name: 'medium') String? medium,
  }) = _StaffImageDto;

  factory StaffImageDto.fromJson(Map<String, dynamic> json) =>
      _$StaffImageDtoFromJson(json);
}
