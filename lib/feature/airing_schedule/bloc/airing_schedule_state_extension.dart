import 'package:anime_tracker/feature/airing_schedule/bloc/airing_schedule_state.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_page_state.dart';

extension AiringScheduleStateEx on AiringScheduleState {
  List<SchedulePageState> get schedulePages => scheduleKeys
      .map((e) => schedulePageMap[e] ?? SchedulePageInit())
      .toList();
}
