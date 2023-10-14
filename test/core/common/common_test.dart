import 'package:anime_tracker/core/common/util/color_util.dart';
import 'package:anime_tracker/core/common/util/time_util.dart';
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
    test('parse_color', () async {
      final res1 = ColorUtil.parseColor('');
      expect(res1 != null, equals(false));

      final res2 = ColorUtil.parseColor('#1234');
      expect(res2 != null, equals(false));

      final res = ColorUtil.parseColor('#123456');
      expect(res != null, equals(true));
    });
  });
}
