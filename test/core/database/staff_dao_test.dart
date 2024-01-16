import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('staff_dao_test', () {
    final animeDatabase = AniflowDatabase();
    StaffDao staffDao = animeDatabase.getStaffDao();

    final dummyVoiceActorData = [
      StaffEntity(
        id: '95084',
        largeImage:
        'https://s4.anilist.co/file/anilistcdn/staff/large/n95084-RTrZSU38POPF.png',
        firstName: '若本規夫',
      ),
      StaffEntity(
        id: '95262',
        largeImage: 'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
        firstName: '堀内賢雄',
      ),
      StaffEntity(
        id: '95346',
        largeImage: 'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
        firstName: 'Character A',
      ),
    ];

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(path: inMemoryDatabasePath);
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.close();
    });

    test('insert_staff_entity', () async {
      await staffDao.insertStaffEntities(dummyVoiceActorData);
    });

    test('insert_and_get_staff', () async {
      await staffDao.insertStaffEntities(dummyVoiceActorData);
      final res = await staffDao.getStaffById('95084');
      expect(res, equals(dummyVoiceActorData[0]));
    });

    test('insert_and_get_staff_stream', () async {
      await staffDao.insertStaffEntities(dummyVoiceActorData);
      final stream = staffDao.getStaffByIdStream('95084');
      final res = await stream.first;
      expect(res, equals(dummyVoiceActorData[0]));
    });
  });
}
