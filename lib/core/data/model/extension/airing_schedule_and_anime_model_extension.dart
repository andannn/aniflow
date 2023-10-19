import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:flutter/material.dart';

extension AiringScheduleAndAnimeModelEx on AiringScheduleAndAnimeModel {
  bool get isAired => airingSchedule.timeUntilAiring?.isNegative ?? false;

  TimeOfDay get airAtTimeOfDay => TimeOfDay.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(airingSchedule.airingAt! * 1000));
}
