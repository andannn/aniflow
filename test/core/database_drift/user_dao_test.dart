import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('user dao test', () {
    late AniflowDatabase db;
    late UserDao dao;

    setUp(() async {
      db = AniflowDatabase.test(NativeDatabase.memory());
      dao = db.userDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('users can be created', () async {
      await dao.upsertUser(const UserEntity(id: '1', name: 'name'));
      final user = await dao.getUser('1');

      expect(user, equals(const UserEntity(id: '1', name: 'name')));
    });

    test('stream emits a new user when the name updates', () async {
      await dao.upsertUser(const UserEntity(id: '1', name: 'name'));
      final expectation = expectLater(
        dao.getUserStream('1').map((event) => event?.name),
        emitsInOrder(['name', 'AAA']),
      );

      await dao.upsertUser(const UserEntity(id: '1', name: 'AAA'));
      await expectation;
    });
  });
}
