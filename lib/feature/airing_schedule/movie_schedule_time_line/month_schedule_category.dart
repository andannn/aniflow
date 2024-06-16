import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MonthScheduleCategory
    extends ScheduleCategoryModel<DateTime, MediaModel> {
  const MonthScheduleCategory(super.key, super.schedules);

  @override
  MonthScheduleCategory appendValue(MediaModel value) {
    return MonthScheduleCategory(key, [...schedules, value]);
  }

  @override
  String translatedTitle(BuildContext context) {
    return context.materialLocal.formatMonthYear(key!);
  }
}

extension MediaModelEx on List<MediaModel> {
  List<MonthScheduleCategory> toScheduleCategory() {
    final schedules = this;
    Map<dynamic, MonthScheduleCategory> group = schedules.groupFoldBy(
      (model) => (model.startDate?.year, model.startDate?.month),
      (previousCategory, model) {
        final category = previousCategory ??
            MonthScheduleCategory(
              model.startDate,
              const [],
            );

        return category.appendValue(model);
      },
    );

    return group.values.toList();
  }
}
