import 'package:flutter_test/flutter_test.dart';

void main() {
  group('common_test', () {
    test('test_data_time', () async {
      DateTime(2023, 1).difference(DateTime(2023, 3)).inDays;
    });
  });
}
