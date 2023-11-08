import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('activity_repository_test', () {
    final animeDatabase = AniflowDatabase();
    ActivityRepository activityRepository = ActivityRepositoryImpl();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      await animeDatabase.initDatabase(path: inMemoryDatabasePath);
      isUnitTest = true;
    });

    test('activity_test_global_list', () async {
      final result = await activityRepository.loadActivitiesByPage(
        loadType: const Refresh(),
        filterType: ActivityFilterType.list,
        scopeType: ActivityScopeCategory.global,
      );
      expect(result.runtimeType, LoadSuccess<List<ActivityModel>>);
    });

    test('activity_test_following_list', () async {
      final result = await activityRepository.loadActivitiesByPage(
        loadType: const Refresh(),
        filterType: ActivityFilterType.list,
        scopeType: ActivityScopeCategory.following,
      );
      expect(result.runtimeType, LoadSuccess<List<ActivityModel>>);
    });

    test('activity_test_following_text', () async {
      final result = await activityRepository.loadActivitiesByPage(
        loadType: const Refresh(),
        filterType: ActivityFilterType.text,
        scopeType: ActivityScopeCategory.following,
      );
      expect(result.runtimeType, LoadSuccess<List<ActivityModel>>);
    });

    test('activity_test_global_text', () async {
      final result = await activityRepository.loadActivitiesByPage(
        loadType: const Refresh(),
        filterType: ActivityFilterType.text,
        scopeType: ActivityScopeCategory.global,
      );
      expect(result.runtimeType, LoadSuccess<List<ActivityModel>>);
    });
  });
}
