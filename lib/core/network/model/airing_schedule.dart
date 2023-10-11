import 'package:freezed_annotation/freezed_annotation.dart';

part 'airing_schedule.freezed.dart';

part 'airing_schedule.g.dart';

@freezed
class AiringSchedule with _$AiringSchedule {
  factory AiringSchedule({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'mediaId') int? mediaId,
    @JsonKey(name: 'airingAt') int? airingAt,
    @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
    @JsonKey(name: 'episode') int? episode,
  }) = _AiringSchedule;

  factory AiringSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_AiringScheduleFromJson(json);
}
