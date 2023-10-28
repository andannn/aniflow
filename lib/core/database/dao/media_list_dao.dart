// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:async';

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_list_entity.dart';
import 'package:aniflow/core/database/model/relations/media_list_and_media_relation.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.mediaListTable]
mixin MediaListTableColumns {
  static const String id = 'media_list_id';
  static const String userId = 'media_list_user_id';
  static const String mediaId = 'media_list_media_id';
  static const String status = 'media_list_status';
  static const String progress = 'media_list_progress';
  static const String score = 'media_list_score';
  static const String updatedAt = 'media_list_updatedAt';
}

abstract class MediaListDao {
  Future removeMediaListByUserId(String userId);

  Future<MediaListEntity?> getMediaListItem(
      {required String mediaId, String? entryId});

  Future<List<MediaListAndMediaRelation>> getMediaListByPage(
      String userId, List<MediaListStatus> status,
      {required MediaType type,
      required int page,
      int? perPage = Config.defaultPerPageCount});

  Future<Set<String>> getMediaListMediaIdsByUser(
      String userId, List<MediaListStatus> status, MediaType type);

  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      String userId, List<MediaListStatus> status, MediaType type);

  Stream<List<MediaListAndMediaRelation>> getMediaListStream(
      String userId, List<MediaListStatus> status, MediaType type);

  Future<bool> getIsTrackingByUserAndId(
      {required String userId, required String mediaId});

  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String mediaId});

  Future insertMediaListEntities(List<MediaListEntity> entities);

  Future insertMediaListAndMediaRelations(
      List<MediaListAndMediaRelation> entities);

  Future deleteMediaListOfUser(String userId);

  void notifyMediaListChanged(String userId);
}

class MediaListDaoImpl extends MediaListDao {
  final AniflowDatabase database;

  MediaListDaoImpl(this.database);

  final Map<String, ValueNotifier> _notifiers = {};

  @override
  Future removeMediaListByUserId(String userId) async {
    await database.aniflowDB.delete(
      Tables.mediaListTable,
      where: '${MediaListTableColumns.userId}=$userId',
    );
  }

  @override
  Future<List<MediaListAndMediaRelation>> getMediaListByPage(
      String userId, List<MediaListStatus> status,
      {required MediaType type, required int page, int? perPage}) async {
    final int? limit = perPage;
    final int offset = (page - 1) * (perPage ?? 0);
    String statusParam = '';
    for (var e in status) {
      statusParam += '\'${e.sqlTypeString}\'';
      if (status.last != e) {
        statusParam += ',';
      }
    }

    String sql = 'select * from ${Tables.mediaListTable} as ua '
        'left join ${Tables.mediaTable} as a '
        'on ua.${MediaListTableColumns.mediaId}=a.${MediaTableColumns.id} '
        'where ${MediaListTableColumns.status} in ($statusParam) '
        '  and ${MediaListTableColumns.userId}=\'$userId\' '
        '  and a.${MediaTableColumns.type}=\'${type.jsonString}\' '
        'order by ${MediaListTableColumns.updatedAt} desc ';
    if (limit != null) {
      sql += 'limit $limit '
          'offset $offset ';
    }

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);
    return result
        .map((e) => MediaListAndMediaRelation(
              mediaListEntity: MediaListEntity.fromJson(e),
              mediaEntity: MediaEntity.fromJson(e),
            ))
        .toList();
  }

  @override
  Future<Set<String>> getMediaListMediaIdsByUser(
      String userId, List<MediaListStatus> status, MediaType type) async {
    String statusParam = '';
    for (var e in status) {
      statusParam += '\'${e.sqlTypeString}\'';
      if (status.last != e) {
        statusParam += ',';
      }
    }

    String sql =
        'select ${MediaListTableColumns.mediaId} from ${Tables.mediaListTable} as ml '
        'join ${Tables.mediaTable} as m '
        '  on ml.${MediaListTableColumns.mediaId} = m.${MediaTableColumns.id} '
        'where ml.${MediaListTableColumns.status} in ($statusParam) '
        '  and ml.${MediaListTableColumns.userId}=\'$userId\' '
        '  and m.${MediaTableColumns.type}=\'${type.jsonString}\' ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);
    return result
        .map((e) => (e[MediaListTableColumns.mediaId]).toString())
        .toSet();
  }

  @override
  Future<MediaListEntity?> getMediaListItem(
      {required String mediaId, String? entryId}) async {
    String sql = 'select * from ${Tables.mediaListTable} '
        'where ${MediaListTableColumns.mediaId}=\'$mediaId\' ';
    if (entryId != null) {
      sql += 'and ${MediaListTableColumns.id}=\'$entryId\'';
    }
    sql += 'limit 1';

    List<Map<String, dynamic>> jsonResult =
        await database.aniflowDB.rawQuery(sql);
    if (jsonResult.isNotEmpty) {
      return MediaListEntity.fromJson(jsonResult[0]);
    } else {
      return null;
    }
  }

  @override
  Future<bool> getIsTrackingByUserAndId(
      {required String userId, required String mediaId}) async {
    final status = [MediaListStatus.planning, MediaListStatus.current];
    String statusParam = '';
    for (var e in status) {
      statusParam += '\'${e.sqlTypeString}\'';
      if (status.last != e) {
        statusParam += ',';
      }
    }

    String sql =
        'select ${MediaListTableColumns.id} from ${Tables.mediaListTable} '
        'where ${MediaListTableColumns.mediaId}=\'$mediaId\' '
        '  and ${MediaListTableColumns.userId}=\'$userId\' '
        '  and ${MediaListTableColumns.status} in ($statusParam) '
        'limit 1 ';
    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);
    return result.isNotEmpty;
  }

  @override
  Stream<Set<String>> getMediaListMediaIdsByUserStream(
      String userId, List<MediaListStatus> status, MediaType type) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(
        changeSource, () => getMediaListMediaIdsByUser(userId, status, type));
  }

  @override
  Future insertMediaListEntities(List<MediaListEntity> entities) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.mediaListTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return batch.commit(noResult: true);
  }

  @override
  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String mediaId}) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(changeSource,
        () => getIsTrackingByUserAndId(userId: userId, mediaId: mediaId));
  }

  @override
  Stream<List<MediaListAndMediaRelation>> getMediaListStream(
      String userId, List<MediaListStatus> status, MediaType type) {
    final changeSource = _notifiers.putIfAbsent(userId, () => ValueNotifier(0));
    return StreamUtil.createStream(
        changeSource,
        () => getMediaListByPage(userId, status,
            type: type, page: 1, perPage: null));
  }

  @override
  void notifyMediaListChanged(String userId) {
    final notifier = _notifiers[userId];
    if (notifier != null) {
      notifier.value = notifier.value++;
    }
  }

  @override
  Future insertMediaListAndMediaRelations(
      List<MediaListAndMediaRelation> entities) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.mediaListTable,
        entity.mediaListEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      batch.insert(
        Tables.mediaTable,
        entity.mediaEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return batch.commit(noResult: true);
  }

  @override
  Future deleteMediaListOfUser(String userId) {
    final batch = database.aniflowDB.batch();
    batch.delete(Tables.mediaListTable,
        where: '${MediaListTableColumns.userId} = ?', whereArgs: [userId]);
    return batch.commit(noResult: true);
  }
}
