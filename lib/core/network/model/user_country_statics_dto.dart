import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_country_statics_dto.freezed.dart';

part 'user_country_statics_dto.g.dart';

@freezed
class UserCountryStaticsDto with _$UserCountryStaticsDto {
  const factory UserCountryStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') int? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'releaseYear') int? releaseYear,
  }) = _UserCountryStaticsDto;

  factory UserCountryStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserCountryStaticsDtoFromJson(json);
}
