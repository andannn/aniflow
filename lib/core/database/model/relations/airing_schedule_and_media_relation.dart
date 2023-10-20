import 'package:aniflow/core/database/model/airing_schedules_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';

class AiringScheduleAndMediaRelation {
  final AiringSchedulesEntity airingSchedule;
  final MediaEntity mediaEntity;

  AiringScheduleAndMediaRelation(
      {required this.airingSchedule, required this.mediaEntity});
}
