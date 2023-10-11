import 'package:anime_tracker/util/time_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('common_test', () {
    test('test_data_time', () async {
      DateTime(2023, 1).difference(DateTime(2023, 3)).inDays;
    });
    test('test_data_time_2', () async {
      DateTime.fromMillisecondsSinceEpoch(60 * 60 * 1000)
          .difference(DateTime.fromMillisecondsSinceEpoch(0))
          .inMinutes;
    });
    test('today', () async {
      TimeUtil.getTimeRange(DateTime.now(), daysAfter: 0, daysAgo: 0);
    });
  });
}
