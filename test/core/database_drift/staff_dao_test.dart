import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/relations/staff_and_role_relation_entity.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('staff dao test', () {
    late AniflowDatabase2 db;
    late StaffDao dao;

    setUp(() async {
      db = AniflowDatabase2.test(NativeDatabase.memory());
      dao = db.staffDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummy = [
      const StaffAndRoleRelationEntity(
        staff: StaffEntity(
          id: '95084',
          largeImage:
              'https://s4.anilist.co/file/anilistcdn/staff/large/n95084-RTrZSU38POPF.png',
          firstName: '若本規夫',
        ),
        role: 'back',
      ),
      const StaffAndRoleRelationEntity(
        staff: StaffEntity(
          id: '95262',
          largeImage:
              'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
          firstName: '堀内賢雄',
        ),
        role: 'back',
      ),
    ];

    test('staff can be created', () async {
      const staffEntity = StaffEntity(id: "1", nativeName: "AAA");
      await dao.upsertStaffEntities([staffEntity]);
      final staff = await dao.getStaff('1');

      expect(staff, equals(staffEntity));
    });

    test('stream emits a new studio when the name updates', () async {
      const staffEntity = StaffEntity(id: "1", nativeName: "AAA");
      await dao.upsertStaffEntities([staffEntity]);
      final expectation = expectLater(
        dao.getStaffStream('1').map((event) => event?.nativeName),
        emitsInOrder(['AAA']),
      );

      await expectation;
    });

    test('insert all and get staff', () async {
      await dao.insertStaffRelationEntitiesOfMedia('1', dummy);

      final res = await dao.getStaffOfMediaByPage('1', page: 1);

      expect(res, equals(dummy));
    });
  });
}
