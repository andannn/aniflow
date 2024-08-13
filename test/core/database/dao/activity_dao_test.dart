import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/relations/activity_and_user_relation.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late AniflowDatabase db;
    late ActivityDao dao;

    setUp(() async {
      db = AniflowDatabase(NativeDatabase.memory());
      dao = db.activityDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummyActivities = [
      const ActivityAndUserRelation(
        user: UserEntity(
          id: '1',
          name: 'Josh',
        ),
        activity: ActivityEntity(
          id: '2',
          userId: '1',
          textContent: "<p>Welcome to 2.0 :)</p>",
          type: "TEXT",
          replyCount: 25,
          siteUrl: "https://anilist.co/activity/2",
          isLocked: true,
          isLiked: false,
          likeCount: 89,
          isPinned: false,
          createdAt: 1417356320,
        ),
      ),
      const ActivityAndUserRelation(
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
          isLiked: true,
          isLocked: false,
          likeCount: 18,
          isPinned: false,
          createdAt: 1417359311,
        ),
        media: MediaEntity(
          id: '20806',
          nativeTitle: 'クロスアンジュ 天使と竜の輪舞',
        ),
      ),
    ];

    test('insert_activity_table', () async {
      await dao.upsertActivityEntitiesWithCategory(
        dummyActivities,
        'category_type1',
      );

      final res = await dao.getActivityEntitiesByPage('category_type1');

      expect(res, equals(dummyActivities));
    });

    test('get_activity', () async {
      await dao.upsertActivityEntitiesWithCategory(
          dummyActivities,
        'category_type1');
      final res = await dao.getActivity("2");
      expect(res, equals(dummyActivities[0]));
    });

    test('clear_activity', () async {
      await dao.upsertActivityEntitiesWithCategory(
          dummyActivities,
        'category_type1');

      await dao.clearActivityEntities('category_type1');
      final res = await dao.getActivityEntitiesByPage('category_type1');
      expect(res, equals([]));
    });

    test('update shortcut activity status', () async {
      await dao.upsertActivityEntitiesWithCategory(
          dummyActivities,
        'category_type1');

      await dao.updateActivityStatus('3', (1, 3, false));
      final res = await dao.getActivity('3');
      expect(res.activity.likeCount, equals(1));
      expect(res.activity.replyCount, equals(3));
      expect(res.activity.isLiked, equals(false));
    });
  });
}
