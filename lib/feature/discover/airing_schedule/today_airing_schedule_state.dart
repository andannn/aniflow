import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_airing_schedule_state.freezed.dart';

@freezed
class TodayAiringScheduleState with _$TodayAiringScheduleState {
  const factory TodayAiringScheduleState({
    @Default([]) List<AiringScheduleAndAnimeModel> schedules,
  }) = _TodayAiringScheduleState;
}
