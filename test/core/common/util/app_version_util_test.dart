import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('common_test', () {
    test('test_app_version_parse', () async {
      final version = AppVersion.parse('1.2.3');
      expect(version.major, 1);
      expect(version.minor, 2);
      expect(version.patch, 3);
    });

    test('test compare app version', () async {
      final version = AppVersion.parse('1.2.3');
      final version2 = AppVersion.parse('1.2.4');
      expect(version.compareTo(version2), -1);

      final version3 = AppVersion.parse('1.1.2');
      final version4 = AppVersion.parse('1.2.2');
      expect(version3.compareTo(version4), -1);

      final version5 = AppVersion.parse('1.2.2');
      final version6 = AppVersion.parse('2.2.2');
      expect(version5.compareTo(version6), -1);
    });
    
    test('test map to version', () async {
      final version = await AppVersionUtil.mapToVersion('1.a.3');
      expect(version, equals(null));
    });
  });
}
