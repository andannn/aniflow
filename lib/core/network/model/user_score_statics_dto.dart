import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_score_statics_dto.freezed.dart';

part 'user_score_statics_dto.g.dart';

@freezed
class UserScoreStaticsDto with _$UserScoreStaticsDto {
  const factory UserScoreStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') int? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'score') int? score,
  }) = _UserScoreStaticsDto;

  factory UserScoreStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserScoreStaticsDtoFromJson(json);
}
