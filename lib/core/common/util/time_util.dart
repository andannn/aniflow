import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:flutter/material.dart';

mixin TimeUtil {
  /// Calculate minus from [seconds]
  static Duration durationFromSeconds(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000)
        .difference(DateTime.fromMillisecondsSinceEpoch(0));
  }

  static DateTime timeAfterMilliseconds(int milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch + milliseconds,
    );
  }

  static String? getFormattedDuration(BuildContext context, Duration duration) {
    final result = <String>[];
    final days = duration.inDays;
    final hours = duration.inHours % 60;
    final minutes = duration.inMinutes % 60;
    final local = context.appLocal;
    if (days != 0) {
      result.add('$days${local.days}');
    }
    if (hours != 0) {
      result.add('$hours${local.hours}');
    }
    if (minutes != 0) {
      result.add('$minutes${local.minutes}');
    }
    return result.firstOrNull;
  }

  /// Get range of millisecondsSinceEpoch, which is [daysAgo] from today
  /// and [daysAfter] after today.
  /// For example:
  /// current time is: 2023-10-11 15:10:26.818764
  /// return rage is: (2023-10-05 00:00:00.000, 2023-10-17 23:59:59.999)
  static (int, int) getTimeRange(DateTime time,
      {required int daysAgo, required int daysAfter}) {
    final timeAgo = time.subtract(Duration(days: daysAgo));
    final timeAfter = time.add(Duration(days: daysAfter));

    final rangeStart = DateTime(timeAgo.year, timeAgo.month, timeAgo.day)
        .millisecondsSinceEpoch;
    final rangeEnd =
        DateTime(timeAfter.year, timeAfter.month, timeAfter.day + 1)
                .millisecondsSinceEpoch - 1;

    return (rangeStart, rangeEnd);
  }

  static (int, int) getTimeRangeOfTheTargetDay(DateTime time) {
    return getTimeRange(time, daysAgo: 0, daysAfter: 0);
  }
}
