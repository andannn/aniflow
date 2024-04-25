import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('preference test', () {
    late UserDataPreferences preferences;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      preferences = UserDataPreferences(sharedPref);
    });

    tearDown(() async {});

    test('set theme test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.themeSetting);
      await preferences.setThemeSetting(ThemeSetting.dark);
      await expectLater(stream, emits(ThemeSetting.dark));
    });

    test('setSeasonYear test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.seasonYear);
      await preferences.setSeasonYear(2020);
      await expectLater(stream, emits(2020));
    });

    test('setSeasonYear test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.seasonYear);
      await preferences.setSeasonYear(2020);
      await expectLater(stream, emits(2020));
    });

    test('setAnimeSeason test', () async {
      final stream = preferences.userDataStream.map((event) => event.season);
      await preferences.setAnimeSeason(AnimeSeason.winter);
      await expectLater(stream, emits(AnimeSeason.winter));
    });

    test('setMediaType test', () async {
      final stream = preferences.userDataStream.map((event) => event.mediaType);
      await preferences.setMediaType(MediaType.manga);
      await expectLater(stream, emits(MediaType.manga));
    });

    test('setIsShowReleaseOnly test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.isShowReleaseOnly);
      await preferences.setIsShowReleaseOnly(true);
      await expectLater(stream, emits(true));
    });

    test('setActivityScopeCategory test', () async {
      final stream = preferences.userDataStream
          .map((event) => event.activityScopeCategory);
      await preferences
          .setActivityScopeCategory(ActivityScopeCategory.following);
      await expectLater(stream, emits(ActivityScopeCategory.following));
    });

    test('setActivityFilterType test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.activityFilterType);
      await preferences.setActivityFilterType(ActivityFilterType.text);
      await expectLater(stream, emits(ActivityFilterType.text));
    });

    test('setActivityFilterType test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.activityFilterType);
      await preferences.setActivityFilterType(ActivityFilterType.text);
      await expectLater(stream, emits(ActivityFilterType.text));
    });

    test('setAuthedUserId test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.authedUserId);
      await preferences.setAuthedUserId("AAAAAAA");
      await expectLater(stream, emits("AAAAAAA"));
    });

    test('setAuthedUserId test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.authedUserId);
      await preferences.setAuthedUserId("AAAAAAA");
      await preferences.setAuthedUserId(null);
      await expectLater(stream, emits(null));
    });

    test('remove auth token test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.authedUserId);
      await preferences.setAuthedUserId("AAAAAAA");
      await preferences.setAuthedUserId(null);
      await expectLater(stream, emits(null));
    });

    test('setAuthToken test', () async {
      final stream = preferences.userDataStream.map((event) => event.authToken);
      await preferences.setAuthToken("AAAAAAA");
      await expectLater(stream, emits("AAAAAAA"));
    });

    test('remove auth token test', () async {
      final stream = preferences.userDataStream.map((event) => event.authToken);
      await preferences.setAuthToken("AAAAAAA");
      await preferences.setAuthToken(null);
      await expectLater(stream, emits(null));
    });

    test('setAuthExpiredTime test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.authExpiredTime);
      await preferences.setAuthExpiredTime(DateTime(1222));
      await expectLater(stream, emits(DateTime(1222)));
    });

    test('remove AuthExpiredTime test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.authExpiredTime);
      await preferences.setAuthExpiredTime(DateTime(1222));
      await preferences.setAuthExpiredTime(null);
      await expectLater(stream, emits(null));
    });

    test('setAuthExpiredTime test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.displayAdultContent);
      await preferences
          .setAniListSettings(AniListSettings(displayAdultContent: true));
      await expectLater(stream, emits(true));
    });

    test('setAniListSettings displayAdultContent test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.displayAdultContent);
      await preferences
          .setAniListSettings(AniListSettings(displayAdultContent: true));
      await expectLater(stream, emits(true));
    });

    test('setAniListSettings userTitleLanguage test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.userTitleLanguage);
      await preferences.setAniListSettings(
          AniListSettings(userTitleLanguage: UserTitleLanguage.romaji));
      await expectLater(stream, emits(UserTitleLanguage.romaji));
    });

    test('setAniListSettings userTitleLanguage test', () async {
      final stream = preferences.userDataStream
          .map((event) => event.userStaffNameLanguage);
      await preferences.setAniListSettings(
          AniListSettings(userStaffNameLanguage: UserStaffNameLanguage.romaji));
      await expectLater(stream, emits(UserStaffNameLanguage.romaji));
    });

    test('setAniListSettings scoreFormat test', () async {
      final stream =
          preferences.userDataStream.map((event) => event.scoreFormat);
      await preferences.setAniListSettings(
          AniListSettings(scoreFormat: ScoreFormat.point100));
      await expectLater(stream, emits(ScoreFormat.point100));
    });
  });
}
