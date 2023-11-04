import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
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

    test('set_and_get_media_type', () async {
      await preference.setCurrentMediaType(MediaType.manga);
      expect(preference.getCurrentMediaType(), equals(MediaType.manga));
    });

    test('get_media_type_stream', () async {
      final stream1 = preference.getCurrentMediaTypeStream();

      final res = await stream1.first;
      expect(res, equals(MediaType.anime));

      final stream2 = preference.getCurrentMediaTypeStream();
      await preference.setCurrentMediaType(MediaType.manga);
      final res1 = await stream2.first;
      expect(res1, equals(MediaType.manga));
    });

    test('get_activity_filter_stream', () async {
      final stream1 = preference.getActivityFilterTypeStream();

      final res = await stream1.first;
      expect(res, equals(ActivityFilterType.all));

      final stream2 = preference.getActivityFilterTypeStream();
      await preference.setActivityFilterType(ActivityFilterType.list);
      final res1 = await stream2.first;
      expect(res1, equals(ActivityFilterType.list));
    });

    test('get_activity_scope_stream', () async {
      final stream1 = preference.getActivityScopeCategoryStream();

      final res = await stream1.first;
      expect(res, equals(ActivityScopeCategory.global));

      final stream2 = preference.getActivityScopeCategoryStream();
      await preference
          .setActivityScopeCategory(ActivityScopeCategory.following);
      final res1 = await stream2.first;
      expect(res1, equals(ActivityScopeCategory.following));
    });
  });
}
