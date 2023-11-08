import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('notification_repository_test', () {
    late NotificationRepository repository;
    final animeDatabase = AniflowDatabase();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      SharedPreferences.setMockInitialValues({});
      isUnitTest = true;
      await AniFlowPreferences().init();
      await animeDatabase.initDatabase(path: inMemoryDatabasePath);

      repository = NotificationRepositoryImpl();
    });

    tearDown(() => animeDatabase.aniflowDB.close());

    test('notification_page', () async {
      final res = await repository.loadNotificationsByPage(
        page: 1,
        perPage: 50,
        category: NotificationCategory.activity,
      );
      expect(res.runtimeType, LoadSuccess<List<NotificationModel>>);
    });
  });
}
