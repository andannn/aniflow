import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/activity_entity.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AniflowDatabase();
    late ActivityDao activityDao;
    late UserDataDao userDataDao;

    final dummyActivities = [
      ActivityEntity(
        id: '2',
        userId: '1',
        text: "<p>Welcome to 2.0 :)</p>",
        type: "TEXT",
        replyCount: 25,
        siteUrl: "https://anilist.co/activity/2",
        isLocked: true,
        isLiked: false,
        likeCount: 89,
        isPinned: false,
        createdAt: 1417356320,
      )
    ];

    final userData = [
      UserEntity(
        id: '1',
        name: 'user a',
      ),
    ];
    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(isTest: true);

      activityDao = AniflowDatabase().getActivityDao();
      userDataDao = AniflowDatabase().getUserDataDao();
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.delete(Tables.activityTable);
      await animeDatabase.aniflowDB.delete(Tables.userDataTable);
    });

    test('insert_activity_table', () async {
      await activityDao.upsertActivityEntities(dummyActivities);
    });

    test('get_activities', () async {
      await activityDao.upsertActivityEntities(dummyActivities);
      await userDataDao.updateUserData(userData.first);

      await activityDao.getActivityEntities(1, 12);
    });
  });
}
