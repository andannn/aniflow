import 'package:anime_tracker/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:anime_tracker/core/data/model/extension/airing_schedule_and_anime_model_extension.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_category.dart';
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

  List<ScheduleCategory> get categories => _buildCategories();

  @override
  List<Object?> get props => [schedules];

  List<ScheduleCategory> _buildCategories() {
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

class SchedulePageError extends SchedulePageState {
  final Exception exception;

  SchedulePageError({required this.exception});

  @override
  List<Object?> get props => [exception];
}
