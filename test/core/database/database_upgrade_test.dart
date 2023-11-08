import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AniflowDatabase();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.close();
      await databaseFactory.deleteDatabase(animeDatabase.aniflowDB.path);
    });

    test('openDatabase_version_1', () async {
      await animeDatabase.initDatabase(path: databaseFileName, version: 2);
      logger.d(animeDatabase.aniflowDB.path);
    });

    test('openDatabase_version_2', () async {
      await animeDatabase.initDatabase(path: databaseFileName, version: 1);
      await animeDatabase.aniflowDB.close();

      await animeDatabase.initDatabase(path: databaseFileName, version: 3);
    });
  });
}
