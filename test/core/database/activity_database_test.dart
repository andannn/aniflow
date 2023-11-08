import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/model/extension/activity_type_extension.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/model/activity_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/relations/activity_and_user_relation.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AniflowDatabase();
    late ActivityDao activityDao;

    final dummyActivities = [
      ActivityAndUserRelation(
        user: UserEntity(
          id: '1',
          name: 'Josh',
        ),
        activity: ActivityEntity(
          id: '2',
          userId: '1',
          text: "<p>Welcome to 2.0 :)</p>",
          type: "TEXT",
          replyCount: 25,
          siteUrl: "https://anilist.co/activity/2",
          isLocked: 1,
          isLiked: 0,
          likeCount: 89,
          isPinned: 0,
          createdAt: 1417356320,
        ),
      ),
      ActivityAndUserRelation(
        user: UserEntity(
          id: '1790',
          name: 'Mex',
        ),
        activity: ActivityEntity(
          id: '3',
          userId: '1790',
          mediaId: '20806',
          type: "ANIME_LIST",
          replyCount: 24,
          status: "watched episode",
          progress: "9",
          isLiked: 1,
          isLocked: 0,
          likeCount: 18,
          isPinned: 0,
          createdAt: 1417359311,
        ),
        media: MediaEntity(
          id: '20806',
          nativeTitle: 'クロスアンジュ 天使と竜の輪舞',
        ),
      ),
    ];

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(path: inMemoryDatabasePath);

      activityDao = AniflowDatabase().getActivityDao();
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.close();
    });

    test('insert_activity_table', () async {
      await activityDao.upsertActivityEntities(
          dummyActivities,
          (ActivityFilterType.all, ActivityScopeCategory.global)
              .combineJsonKey);
    });

    test('get_activities', () async {
      await activityDao.upsertActivityEntities(
          dummyActivities,
          (ActivityFilterType.all, ActivityScopeCategory.global)
              .combineJsonKey);
      await activityDao.getActivityEntities(
          1,
          12,
          (ActivityFilterType.all, ActivityScopeCategory.global)
              .combineJsonKey);
    });
  });
}
