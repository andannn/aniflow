import 'dart:async';

import 'package:anime_tracker/core/common/stream_util.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/anime_track_item_entity.dart';
import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/database/model/relations/user_anime_list_and_anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.animeTrackListTable]
mixin AnimeTrackItemTableColumns {
  static const String id = 'media_list_id';
  static const String userId = 'user_id';
  static const String animeId = 'anime_id';
  static const String status = 'anime_list_status';
  static const String progress = 'anime_list_progress';
  static const String score = 'score';
  static const String updatedAt = 'updatedAt';
}

abstract class AnimeTrackListDao {
  Future removeUserAnimeListByUserId(String userId);

  Future<AnimeTrackItemEntity?> getAnimeTrackItem(
      {required String animeId, String? entryId});

  Future<List<UserAnimeListAndAnime>> getUserAnimeListByPage(
      String userId, List<AnimeListStatus> status,
      {required int page, int? perPage = Config.defaultPerPageCount});

  Future<Set<String>> getAnimeListAnimeIdsByUser(
      String userId, List<AnimeListStatus> status);

  Stream<Set<String>> getAnimeListAnimeIdsByUserStream(
      String userId, List<AnimeListStatus> status);

  Stream<List<UserAnimeListAndAnime>> getUserAnimeListStream(
      String userId, List<AnimeListStatus> status);

  Future<bool> getIsTrackingByUserAndId(
      {required String userId, required String animeId});

  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId});

  Future insertTrackingAnimeListEntities(List<AnimeTrackItemEntity> entities);

  void notifyTrackingAnimeContentChanged(String userId);
}

class UserAnimeListDaoImpl extends AnimeTrackListDao {
  final AnimeDatabase database;

  UserAnimeListDaoImpl(this.database);

  final Map<String, ValueNotifier> _notifiers = {};

  @override
  Future removeUserAnimeListByUserId(String userId) async {
    await database.animeDB.delete(
      Tables.animeTrackListTable,
      where: '${AnimeTrackItemTableColumns.userId}=$userId',
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

    String sql = 'select * from ${Tables.animeTrackListTable} as ua '
        'left join ${Tables.animeTable} as a '
        'on ua.${AnimeTrackItemTableColumns.animeId}=a.${AnimeTableColumns.id} '
        'where ${AnimeTrackItemTableColumns.status} in ($statusParam) and ${AnimeTrackItemTableColumns.userId}=\'$userId\' '
        'order by ${AnimeTrackItemTableColumns.updatedAt} desc ';
    if (limit != null) {
      sql += 'limit $limit '
          'offset $offset ';
    }

    final List<Map<String, dynamic>> result =
        await database.animeDB.rawQuery(sql);
    return result
        .map((e) => UserAnimeListAndAnime(
              userAnimeListEntity: AnimeTrackItemEntity.fromJson(e),
              animeEntity: AnimeEntity.fromJson(e),
            ))
        .toList();
  }

  @override
  Future<Set<String>> getAnimeListAnimeIdsByUser(
      String userId, List<AnimeListStatus> status) async {
    String statusParam = '';
    for (var e in status) {
      statusParam += '\'${e.sqlTypeString}\'';
      if (status.last != e) {
        statusParam += ',';
      }
    }

    String sql =
        'select ${AnimeTrackItemTableColumns.animeId} from ${Tables.animeTrackListTable} '
        'where ${AnimeTrackItemTableColumns.status} in ($statusParam) '
        '  and ${AnimeTrackItemTableColumns.userId}=\'$userId\' ';

    final List<Map<String, dynamic>> result =
        await database.animeDB.rawQuery(sql);
    return result
        .map((e) => (e[AnimeTrackItemTableColumns.animeId]).toString())
        .toSet();
  }

  @override
  Future<AnimeTrackItemEntity?> getAnimeTrackItem(
      {required String animeId, String? entryId}) async {
    String sql = 'select * from ${Tables.animeTrackListTable} '
        'where ${AnimeTrackItemTableColumns.animeId}=\'$animeId\' ';
    if (entryId != null) {
      sql += 'and ${AnimeTrackItemTableColumns.id}=\'$entryId\'';
    }
    sql += 'limit 1';

    List<Map<String, dynamic>> jsonResult =
        await database.animeDB.rawQuery(sql);
    if (jsonResult.isNotEmpty) {
      return AnimeTrackItemEntity.fromJson(jsonResult[0]);
    } else {
      return null;
    }
  }

  @override
  Future<bool> getIsTrackingByUserAndId(
      {required String userId, required String animeId}) async {
    final status = [AnimeListStatus.planning, AnimeListStatus.current];
    String statusParam = '';
    for (var e in status) {
      statusParam += '\'${e.sqlTypeString}\'';
      if (status.last != e) {
        statusParam += ',';
      }
    }

    String sql =
        'select ${AnimeTrackItemTableColumns.id} from ${Tables.animeTrackListTable} '
        'where ${AnimeTrackItemTableColumns.animeId}=\'$animeId\' '
        '  and ${AnimeTrackItemTableColumns.userId}=\'$userId\' '
        '  and ${AnimeTrackItemTableColumns.status} in ($statusParam) '
        'limit 1 ';
    final List<Map<String, dynamic>> result =
        await database.animeDB.rawQuery(sql);
    return result.isNotEmpty;
  }

  @override
  Stream<Set<String>> getAnimeListAnimeIdsByUserStream(
      String userId, List<AnimeListStatus> status) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(
        changeSource, () => getAnimeListAnimeIdsByUser(userId, status));
  }

  @override
  Future insertTrackingAnimeListEntities(
      List<AnimeTrackItemEntity> entities) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.animeTrackListTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  @override
  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId}) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(changeSource,
        () => getIsTrackingByUserAndId(userId: userId, animeId: animeId));
  }

  @override
  Stream<List<UserAnimeListAndAnime>> getUserAnimeListStream(
      String userId, List<AnimeListStatus> status) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(changeSource,
        () => getUserAnimeListByPage(userId, status, page: 1, perPage: null));
  }

  @override
  void notifyTrackingAnimeContentChanged(String userId) {
    final notifier = _notifiers[userId];
    if (notifier != null) {
      notifier.value = notifier.value++;
    }
  }
}
