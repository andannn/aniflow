import 'package:anime_tracker/core/database/model/airing_schedules_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'airing_schedule_model.freezed.dart';

@freezed
class AiringScheduleModel with _$AiringScheduleModel {
  factory AiringScheduleModel({
    @Default('') String id,
    int? airingAt,
    int? timeUntilAiring,
    int? episode,
  }) = _AiringScheduleModel;

  static AiringScheduleModel fromEntity(AiringSchedulesEntity entity) {
    return AiringScheduleModel(
      id: entity.id,
      airingAt: entity.airingAt,
      timeUntilAiring: entity.timeUntilAiring,
      episode: entity.episode
    );
  }
}
