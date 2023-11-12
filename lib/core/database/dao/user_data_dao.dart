import 'dart:async';

import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:sqflite/sqflite.dart';

mixin UserDataTableColumns {
  static const String id = 'user_data_id';
  static const String name = 'user_data_name';
  static const String avatarImage = 'user_data_avatar_image';
  static const String bannerImage = 'user_data_banner_image';
  static const String profileColor = 'user_data_profile_color';
}

abstract class UserDataDao {
  Future updateUserData(UserEntity userDataEntity);

  Future<UserEntity?> getUserData(String id);
}

class UserDataDaoImpl extends UserDataDao {
  final AniflowDatabase database;

  UserDataDaoImpl(this.database);

  @override
  Future updateUserData(UserEntity userDataEntity) {
    final batch = database.aniflowDB.batch();
    batch.insert(Tables.userDataTable, userDataEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return batch.commit(noResult: true);
  }

  @override
  Future<UserEntity?> getUserData(String id) async {
    final resultJson = await database.aniflowDB.query(Tables.userDataTable,
        where: '${UserDataTableColumns.id} = $id', limit: 1);

    if (resultJson.isEmpty) return null;

    return UserEntity.fromJson(resultJson[0]);
  }
}
