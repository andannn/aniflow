import 'dart:async';

import 'package:anime_tracker/core/common/stream_util.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/user_anime_list_entity.dart';
import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/database/model/relations/user_anime_list_and_anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.userAnimeListTable]
mixin UserAnimeListTableColumns {
  static const String id = 'media_list_id';
  static const String userId = 'user_id';
  static const String animeId = 'anime_id';
  static const String status = 'anime_list_status';
  static const String progress = 'anime_list_progress';
  static const String score = 'score';
  static const String updatedAt = 'updatedAt';
}

abstract class UserAnimeListDao {
  Future removeUserAnimeListByUserId(int userId);

  Future<List<UserAnimeListAndAnime>> getUserAnimeListByPage(
      String userId, List<AnimeListStatus> status,
      {required int page, int? perPage = Config.defaultPerPageCount});

  Stream<List<UserAnimeListAndAnime>> getUserAnimeListStream(
      String userId, List<AnimeListStatus> status);

  Future insertUserAnimeListEntities(List<UserAnimeListEntity> entities);

  void notifyUserAnimeContentChanged(String userId);
}

class UserAnimeListDaoImpl extends UserAnimeListDao {
  final AnimeDatabase database;

  UserAnimeListDaoImpl(this.database);

  final Map<String, ValueNotifier> _notifiers = {};

  @override
  Future removeUserAnimeListByUserId(int userId) async {
    await database.animeDB.delete(
      Tables.userAnimeListTable,
      where: '${UserAnimeListTableColumns.userId}=$userId',
    );
  }

  @override
  Future<List<UserAnimeListAndAnime>> getUserAnimeListByPage(
      String userId, List<AnimeListStatus> status,
      {required int page, int? perPage}) async {
    final int? limit = perPage;
    final int offset = (page - 1) * (perPage ?? 0);
    String statusParam = '';
    for (var e in status) {
      statusParam += '\'${e.sqlTypeString}\'';
      if (status.last != e) {
        statusParam += ',';
      }
    }

    String sql = '''
      select * from ${Tables.userAnimeListTable} as ua
      left join ${Tables.animeTable} as a
      on ua.${UserAnimeListTableColumns.animeId}=a.${AnimeTableColumns.id}
      where ${UserAnimeListTableColumns.status} in ($statusParam) and ${UserAnimeListTableColumns.userId}='$userId' 
      ''';
    if (limit != null) {
      sql += '''
      limit $limit
      offset $offset
      ''';
    }

    final List<Map<String, dynamic>> result =
        await database.animeDB.rawQuery(sql);
    return result
        .map((e) => UserAnimeListAndAnime(
              userAnimeListEntity: UserAnimeListEntity.fromJson(e),
              animeEntity: AnimeEntity.fromJson(e),
            ))
        .toList();
  }

  @override
  Future insertUserAnimeListEntities(List<UserAnimeListEntity> entities) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.userAnimeListTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  @override
  Stream<List<UserAnimeListAndAnime>> getUserAnimeListStream(
      String userId, List<AnimeListStatus> status) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(changeSource,
        () => getUserAnimeListByPage(userId, status, page: 1, perPage: null));
  }

  @override
  void notifyUserAnimeContentChanged(String userId) {
    final notifier = _notifiers[userId];
    if (notifier != null) {
      notifier.value = notifier.value++;
    }
  }
}
