import 'dart:async';

import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/dao_change_notifier_mixin.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:sqflite/sqflite.dart';

mixin UserDataTableColumns {
  static const String id = 'user_data_id';
  static const String name = 'user_data_name';
  static const String avatarImage = 'user_data_avatar_image';
  static const String bannerImage = 'user_data_banner_image';
  static const String profileColor = 'user_data_profile_color';
  static const String unreadNotificationCount =
      'user_data_unread_notification_count';
}

abstract class UserDataDao {
  Future updateUserData(UserEntity userDataEntity);

  Future<UserEntity?> getUserData(String id);

  Stream<UserEntity?> getUserDataStream(String id);
}

class UserDataDaoImpl extends UserDataDao with DbChangedNotifierMixin<String> {
  final AniflowDatabase database;

  UserDataDaoImpl(this.database);

  @override
  Future updateUserData(UserEntity userDataEntity) async {
    final batch = database.aniflowDB.batch();
    batch.insert(Tables.userDataTable, userDataEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    await batch.commit(noResult: true);

    notifyChanged([userDataEntity.id]);
  }

  @override
  Future<UserEntity?> getUserData(String id) async {
    final resultJson = await database.aniflowDB.query(Tables.userDataTable,
        where: '${UserDataTableColumns.id} = $id', limit: 1);

    if (resultJson.isEmpty) return null;

    return UserEntity.fromJson(resultJson[0]);
  }

  @override
  Stream<UserEntity?> getUserDataStream(String id) {
    return createStreamWithKey(id, () => getUserData(id));
  }
}
