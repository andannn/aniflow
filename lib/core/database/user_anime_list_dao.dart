import 'dart:async';

import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/user_anime_list_entity.dart';
import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:flutter/foundation.dart';

mixin UserAnimeListTableColumns {
  static const String id = 'id';
  static const String userId = 'user_id';
  static const String animeId = 'anime_id';
  static const String status = 'status';
  static const String score = 'score';
  static const String updatedAt = 'updatedAt';
}

abstract class UserAnimeListDao {
  Future removeUserAnimeListByUserId(int userId);

  Future<List<UserAnimeListEntity>> getUserAnimeListByPage(
      AnimeListStatus status,
      {required int page,
      int perPage = Config.defaultPerPageCount});
}

class UserAnimeListDaoImpl extends UserAnimeListDao with ChangeNotifier {
  final AnimeDatabase database;

  UserAnimeListDaoImpl(this.database);

  @override
  Future removeUserAnimeListByUserId(int userId) async {
    await database.animeDB.delete(
      Tables.userAnimeListTable,
      where: '${UserAnimeListTableColumns.userId}=$userId',
    );
  }

  @override
  Future<List<UserAnimeListEntity>> getUserAnimeListByPage(
      AnimeListStatus status,
      {required int page,
      int perPage = Config.defaultPerPageCount}) {
    throw UnimplementedError();
  }
}
