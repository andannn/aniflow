import 'dart:async';

import 'package:anime_tracker/core/common/util/stream_util.dart';
import 'package:anime_tracker/core/database/aniflow_database.dart';
import 'package:anime_tracker/core/database/model/user_data_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

mixin UserDataTableColumns {
  static const String id = 'id';
  static const String name = 'name';
  static const String avatarImage = 'avatar_image';
  static const String bannerImage = 'banner_image';
}

abstract class UserDataDao {
  Future updateUserData(UserDataEntity userDataEntity);

  Future<UserDataEntity?> getUserData();

  Future removeUserData();

  Stream<UserDataEntity?> getUserDataStream();
}

class UserDataDaoImpl extends UserDataDao with ChangeNotifier {
  final AniflowDatabase database;

  UserDataDaoImpl(this.database);

  @override
  Future updateUserData(UserDataEntity userDataEntity) {
    final batch = database.aniflowDB.batch();
    batch.delete(Tables.userDataTable);
    batch.insert(Tables.userDataTable, userDataEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return batch.commit(noResult: true).then(
          (value) => notifyListeners(),
        );
  }

  @override
  Future<UserDataEntity?> getUserData() async {
    final resultJson =
        await database.aniflowDB.query(Tables.userDataTable, limit: 1);

    if (resultJson.isEmpty) return null;

    return UserDataEntity.fromJson(resultJson[0]);
  }

  @override
  Stream<UserDataEntity?> getUserDataStream() {
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
