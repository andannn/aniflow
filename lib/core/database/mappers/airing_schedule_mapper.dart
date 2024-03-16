import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';

extension AiringScheduleMapper on AiringScheduleDto {
  AiringScheduleEntity toEntity() {
    return AiringScheduleEntity(
        id: id.toString(),
        mediaId: mediaId.toString(),
        airingAt: airingAt,
        timeUntilAiring: timeUntilAiring,
        episode: episode
    );
  }
}
