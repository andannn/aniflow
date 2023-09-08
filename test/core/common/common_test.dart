import 'package:flutter_test/flutter_test.dart';

void main() {
  group('common_test', () {
    test('test_data_time', () async {
      final res = DateTime(2023, 1).difference(DateTime(2023, 3)).inDays;
      print(res);
    });
  });
}
