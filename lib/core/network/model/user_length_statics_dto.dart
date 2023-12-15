import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_length_statics_dto.freezed.dart';

part 'user_length_statics_dto.g.dart';

@freezed
class UserLengthStaticsDto with _$UserLengthStaticsDto {
  const factory UserLengthStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') int? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'score') int? score,
  }) = _UserLengthStaticsDto;

  factory UserLengthStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserLengthStaticsDtoFromJson(json);
}
