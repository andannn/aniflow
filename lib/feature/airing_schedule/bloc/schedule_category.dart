import 'package:anime_tracker/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_category.freezed.dart';

@freezed
class ScheduleCategory with _$ScheduleCategory {
  factory ScheduleCategory({
    TimeOfDay? timeOfDayHeader,
    @Default([]) List<AiringScheduleAndAnimeModel> schedules
  }) = _ScheduleCategory;
}
