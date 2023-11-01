import 'dart:async';

import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

mixin UserDataTableColumns {
  static const String id = 'id';
  static const String name = 'name';
  static const String avatarImage = 'avatar_image';
  static const String bannerImage = 'banner_image';
}

abstract class UserDataDao {
  Future updateUserData(UserEntity userDataEntity);

  Future<UserEntity?> getUserData();

  Future removeUserData();

  Stream<UserEntity?> getUserDataStream();
}

class UserDataDaoImpl extends UserDataDao with ChangeNotifier {
  final AniflowDatabase database;

  UserDataDaoImpl(this.database);

  @override
  Future updateUserData(UserEntity userDataEntity) {
    final batch = database.aniflowDB.batch();
    batch.delete(Tables.userDataTable);
    batch.insert(Tables.userDataTable, userDataEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return batch.commit(noResult: true).then(
          (value) => notifyListeners(),
        );
  }

  @override
  Future<UserEntity?> getUserData() async {
    final resultJson =
        await database.aniflowDB.query(Tables.userDataTable, limit: 1);

    if (resultJson.isEmpty) return null;

    return UserEntity.fromJson(resultJson[0]);
  }

  @override
  Stream<UserEntity?> getUserDataStream() {
    return StreamUtil.createStream(this, getUserData);
  }

  @override
  Future removeUserData() {
    final batch = database.aniflowDB.batch();
    batch.delete(Tables.userDataTable);

    return batch.commit(noResult: true).then(
          (value) => notifyListeners(),
        );
  }
}
