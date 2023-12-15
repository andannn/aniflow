import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_status_statics_dto.freezed.dart';

part 'user_status_statics_dto.g.dart';

@freezed
class UserStatusStaticsDto with _$UserStatusStaticsDto {
  const factory UserStatusStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') int? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
  }) = _UserStatusStaticsDto;

  factory UserStatusStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserStatusStaticsDtoFromJson(json);
}
