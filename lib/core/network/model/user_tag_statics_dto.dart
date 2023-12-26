import 'package:aniflow/core/network/model/media_tag_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tag_statics_dto.g.dart';

part 'user_tag_statics_dto.freezed.dart';

@freezed
class UserTagStaticsDto with _$UserTagStaticsDto {
  const factory UserTagStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'tag') MediaTagDto? tag,
  }) = _UserTagStaticsDto;

  factory UserTagStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserTagStaticsDtoFromJson(json);
}
