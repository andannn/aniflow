import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_page_key.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'airing_schedule_state.freezed.dart';

@freezed
class AiringScheduleState with _$AiringScheduleState {
  factory AiringScheduleState({
    @Default([]) List<SchedulePageKey> scheduleKeys,
    @Default({}) Map<SchedulePageKey, SchedulePageState> schedulePageMap,
  }) = _AiringScheduleState;
}
