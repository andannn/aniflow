import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('preferences_test', () {
    final preference = AniFlowPreferences();
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await preference.init();
    });
  });
}
