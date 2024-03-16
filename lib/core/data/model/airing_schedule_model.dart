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
}
