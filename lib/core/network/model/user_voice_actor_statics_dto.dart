import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_voice_actor_statics_dto.freezed.dart';

part 'user_voice_actor_statics_dto.g.dart';

@freezed
class UserVoiceActorStaticsDto with _$UserVoiceActorStaticsDto {
  const factory UserVoiceActorStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @Default([]) @JsonKey(name: 'characterIds') List<int> characterIds,
    @JsonKey(name: 'voiceActor') StaffDto? voiceActor,
  }) = _UserVoiceActorStaticsDto;

  factory UserVoiceActorStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserVoiceActorStaticsDtoFromJson(json);
}
