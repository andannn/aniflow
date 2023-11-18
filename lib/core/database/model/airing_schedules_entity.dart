import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'airing_schedules_entity.freezed.dart';

part 'airing_schedules_entity.g.dart';

@freezed
class AiringSchedulesEntity with _$AiringSchedulesEntity {
  factory AiringSchedulesEntity({
    @Default('') @JsonKey(name: AiringSchedulesColumns.id) String id,
    @Default('') @JsonKey(name: AiringSchedulesColumns.mediaId) String mediaId,
    @JsonKey(name: AiringSchedulesColumns.airingAt) int? airingAt,
    @JsonKey(name: AiringSchedulesColumns.timeUntilAiring) int? timeUntilAiring,
    @JsonKey(name: AiringSchedulesColumns.episode) int? episode,
  }) = _AiringSchedulesEntity;

  factory AiringSchedulesEntity.fromJson(Map<String, dynamic> json) =>
      _$$AiringSchedulesEntityImplFromJson(json);

  static AiringSchedulesEntity fromDto(AiringScheduleDto dto) {
    return AiringSchedulesEntity(
      id: dto.id.toString(),
      mediaId: dto.mediaId.toString(),
      airingAt: dto.airingAt,
      timeUntilAiring: dto.timeUntilAiring,
      episode: dto.episode
    );
  }
}
