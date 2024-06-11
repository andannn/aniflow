import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/extension/airing_schedule_and_anime_model_extension.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

sealed class SchedulePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SchedulePageInit extends SchedulePageState {}

class SchedulePageLoading extends SchedulePageState {}

class SchedulePageReady extends SchedulePageState {
  SchedulePageReady({required this.schedules});

  final List<AiringScheduleAndAnimeModel> schedules;

  List<ScheduleCategory> get categories => schedules.toScheduleCategory();

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
  List<ScheduleCategory> toScheduleCategory() {
    final schedules = this;
    Map<int, ScheduleCategory> group = schedules.groupFoldBy((schedule) {
      return schedule.airAtTimeOfDay.hour;
    }, (previousCategory, schedule) {
      final category = previousCategory ??
          ScheduleCategory(
            timeOfDayHeader: schedule.airAtTimeOfDay.replacing(minute: 0),
            schedules: [],
          );

      return category.copyWith(schedules: [...category.schedules, schedule]);
    });

    return group.values.toList();
  }
}