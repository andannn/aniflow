import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:aniflow/core/common/model/setting/user_title_language.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ani_list_settings_test', () {
    AniFlowPreferences preferences = AniFlowPreferences();

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
    });

    test('set_and_get_ani_list_setting_test', () async {
      final setting = AniListSettings(displayAdultContent: true);
      await preferences
          .setAniListSettings(AniListSettings(displayAdultContent: true));
      final result = preferences.getAniListSettings();
      expect(result, equals(setting));
    });

    test('set_and_get_ani_list_setting_stream_test', () async {
      final setting = AniListSettings(
          displayAdultContent: true,
          userTitleLanguage: UserTitleLanguage.native);
      await preferences
          .setAniListSettings(AniListSettings(displayAdultContent: true));
      final stream = preferences.getAniListSettingsStream();
      final result = await stream.first;
      expect(result, equals(setting));
    });
  });
}
