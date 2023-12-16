import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_staff_statics_dto.freezed.dart';

part 'user_staff_statics_dto.g.dart';

@freezed
class UserStaffStaticsDto with _$UserStaffStaticsDto {
  const factory UserStaffStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'staff') StaffDto? staff,
  }) = _UserStaffStaticsDto;

  factory UserStaffStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserStaffStaticsDtoFromJson(json);
}
