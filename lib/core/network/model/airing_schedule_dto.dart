import 'package:aniflow/core/network/model/anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'airing_schedule_dto.freezed.dart';
part 'airing_schedule_dto.g.dart';

@freezed
class AiringScheduleDto with _$AiringScheduleDto {
  factory AiringScheduleDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'mediaId') int? mediaId,
    @JsonKey(name: 'airingAt') int? airingAt,
    @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
    @JsonKey(name: 'episode') int? episode,
    @JsonKey(name: 'media') AnimeDto? media,
  }) = _AiringScheduleDto;

  factory AiringScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$$_AiringScheduleDtoFromJson(json);
}
