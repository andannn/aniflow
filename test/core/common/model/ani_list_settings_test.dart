import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ani_list_settings_test', () {
    // AniFlowPreferences preferences = AniFlowPreferences();

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
    });
  });
}
