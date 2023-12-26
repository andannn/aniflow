import 'package:aniflow/core/network/model/studio_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_studio_statics_dto.freezed.dart';

part 'user_studio_statics_dto.g.dart';

@freezed
class UserStudioStaticsDto with _$UserStudioStaticsDto {
  const factory UserStudioStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'studio') StudioDto? studio,
  }) = _UserStudioStaticsDto;

  factory UserStudioStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserStudioStaticsDtoFromJson(json);
}
