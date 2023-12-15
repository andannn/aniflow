import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_genres_statics_dto.freezed.dart';

part 'user_genres_statics_dto.g.dart';

@freezed
class UserGenreStaticsDto with _$UserGenreStaticsDto {
  const factory UserGenreStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') int? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'genre') String? genre,
  }) = _UserGenreStaticsDto;

  factory UserGenreStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserGenreStaticsDtoFromJson(json);
}
