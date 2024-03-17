import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/user_table.dart';
import 'package:drift/drift.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AniflowDatabase2> with _$UserDaoMixin {
  UserDao(super.db);

  Future<UserEntity?> getUser(String id) {
    return (select(userTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<UserEntity?> getUserStream(String id) {
    return (select(userTable)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future upsertUser(UserEntity user) {
    return into(userTable).insertOnConflictUpdate(user);
  }

  Future insertOrIgnoreUsers(List<UserEntity> users) {
    return batch((batch) {
      batch.insertAll(userTable, users, mode: InsertMode.insertOrIgnore);
    });
  }
}
