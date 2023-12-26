import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_release_year_statics_dto.freezed.dart';

part 'user_release_year_statics_dto.g.dart';

@freezed
class UserReleaseYearStaticsDto with _$UserReleaseYearStaticsDto {
  const factory UserReleaseYearStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'releaseYear') int? releaseYear,
  }) = _UserReleaseYearStaticsDto;

  factory UserReleaseYearStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserReleaseYearStaticsDtoFromJson(json);
}
