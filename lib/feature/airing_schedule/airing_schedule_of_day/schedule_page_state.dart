import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/extension/airing_schedule_and_anime_model_extension.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DayScheduleCategoryModel
    extends ScheduleCategoryModel<TimeOfDay, AiringScheduleAndAnimeModel> {
  const DayScheduleCategoryModel(super.key, super.schedules);

  @override
  DayScheduleCategoryModel appendValue(AiringScheduleAndAnimeModel value) {
    return DayScheduleCategoryModel(key, [...schedules, value]);
  }

  @override
  String translatedTitle(BuildContext context) {
    return context.materialLocal.formatTimeOfDay(key!);
  }
}

sealed class SchedulePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SchedulePageInit extends SchedulePageState {}

class SchedulePageLoading extends SchedulePageState {}

class SchedulePageReady extends SchedulePageState {
  SchedulePageReady({required this.schedules});

  final List<AiringScheduleAndAnimeModel> schedules;

  List<DayScheduleCategoryModel> get categories =>
      schedules.toScheduleCategory();

  @override
  List<Object?> get props => [schedules];
}

class SchedulePageError extends SchedulePageState {
  final Exception exception;

  SchedulePageError({required this.exception});

  @override
  List<Object?> get props => [exception];
}

extension ScheduleCategoryEx on List<AiringScheduleAndAnimeModel> {
  List<DayScheduleCategoryModel> toScheduleCategory() {
    final schedules = this;
    Map<int, DayScheduleCategoryModel> group = schedules.groupFoldBy(
          (schedule) => schedule.airAtTimeOfDay.hour,
          (previousCategory, schedule) {
        final category = previousCategory ??
            DayScheduleCategoryModel(
              schedule.airAtTimeOfDay.replacing(minute: 0),
              const [],
            );

        return category.appendValue(schedule);
      },
    );

    return group.values.toList();
  }
}
