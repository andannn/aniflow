import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/airing_schedule_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/schedule_page_state.dart';
import 'package:flutter/material.dart';

final dummyScheduleCategoryData = [
  DayScheduleCategoryModel(
    const TimeOfDay(hour: 0, minute: 0),
    List.generate(3, (index) {
      return AiringScheduleAndAnimeModel(
        airingSchedule: AiringScheduleModel(),
        mediaModel: MediaModel(),
      );
    }),
  ),
];
