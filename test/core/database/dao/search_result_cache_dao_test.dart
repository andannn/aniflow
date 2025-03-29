import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/search_result_cache_dao.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('search result cache dao test', () {
    late AniflowDatabase db;
    late SearchResultCacheDao dao;

    setUp(() async {
      db = AniflowDatabase(NativeDatabase.memory());
      dao = db.searchResultCacheDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('read cache when no cache exists', () async {
      final res = await dao.getCache('1', '2');
      expect(res, isNull);
    });

    test('get cache', () async {
      await dao.saveCache([
         const SearchResultEntity(
          mediaId: '1',
          mediaSource: '2',
          cache: '3',
        )
      ]);

      final res = await dao.getCache('1', '2');
      expect(res, isNotNull);

      await dao.saveCache([
        const SearchResultEntity(
          mediaId: '1',
          mediaSource: '2',
          cache: '6',
        )
      ]);

      final res2 = await dao.getCache('1', '2');
      expect(res2?.cache, equals('6'));
    });
  });
}
