import 'package:aniflow/core/data/model/airing_schedule_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';

extension AiringScheduleMapper on AiringScheduleEntity {
  AiringScheduleModel toModel() {
    return AiringScheduleModel(
        id: id,
        airingAt: airingAt,
        timeUntilAiring: timeUntilAiring,
        episode: episode
    );
  }
}
