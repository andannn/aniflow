import 'package:equatable/equatable.dart';

class SchedulePageKey extends Equatable {
  const SchedulePageKey({required this.dayFromNow, required this.dateTime});

  final int dayFromNow;
  final DateTime dateTime;

  bool get isToday => dayFromNow == 0;

  @override
  List<Object?> get props => [dayFromNow];

  @override
  String toString() {
    return 'SchedulePageKey(dayFromNow: $dayFromNow, dateTime: $dateTime)';
  }

  static List<SchedulePageKey> createScheduleKeys(DateTime dateTime,
      {required int daysAgo, required int daysAfter}) {
    List<SchedulePageKey> keys = [];
    for (var i = -daysAgo; i <= daysAfter; i++) {
      final daysDifferent = Duration(days: i.abs());
      final newDateTime = i.isNegative
          ? dateTime.subtract(daysDifferent)
          : dateTime.add(daysDifferent);
      keys.add(SchedulePageKey(dayFromNow: i, dateTime: newDateTime));
    }
    return keys;
  }
}

