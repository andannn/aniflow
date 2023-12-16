import 'package:aniflow/core/network/model/user_country_statics_dto.dart';
import 'package:aniflow/core/network/model/user_format_statics_dto.dart';
import 'package:aniflow/core/network/model/user_genres_statics_dto.dart';
import 'package:aniflow/core/network/model/user_length_statics_dto.dart';
import 'package:aniflow/core/network/model/user_release_year_statics_dto.dart';
import 'package:aniflow/core/network/model/user_score_statics_dto.dart';
import 'package:aniflow/core/network/model/user_staff_statics_dto.dart';
import 'package:aniflow/core/network/model/user_status_statics_dto.dart';
import 'package:aniflow/core/network/model/user_studio_statics_dto.dart';
import 'package:aniflow/core/network/model/user_voice_actor_statics_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statistics_dto.freezed.dart';

part 'user_statistics_dto.g.dart';

@freezed
class UserStaticsDto with _$UserStaticsDto {
  const factory UserStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'standardDeviation') int? standardDeviation,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'episodesWatched') int? episodesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @JsonKey(name: 'volumesRead') int? volumesRead,
    @Default([]) @JsonKey(name: 'formats') List<UserFormatStaticsDto> formats,
    @Default([]) @JsonKey(name: 'statuses') List<UserStatusStaticsDto> statuses,
    @Default([]) @JsonKey(name: 'scores') List<UserScoreStaticsDto> scores,
    @Default([]) @JsonKey(name: 'lengths') List<UserLengthStaticsDto> lengths,
    @Default([])
    @JsonKey(name: 'releaseYears')
    List<UserReleaseYearStaticsDto> releaseYears,
    @Default([]) @JsonKey(name: 'genres') List<UserGenreStaticsDto> genres,
    @Default([])
    @JsonKey(name: 'countries')
    List<UserCountryStaticsDto> countries,
    @Default([]) @JsonKey(name: 'staff') List<UserStaffStaticsDto> staff,
    @Default([]) @JsonKey(name: 'studios') List<UserStudioStaticsDto> studios,
    @Default([])
    @JsonKey(name: 'voiceActors')
    List<UserVoiceActorStaticsDto> voiceActors,
  }) = _UserStaticsDto;

  factory UserStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserStaticsDtoFromJson(json);
}
