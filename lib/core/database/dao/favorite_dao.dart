// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.favoriteInfoTable]
mixin FavoriteInfoTableColumn {
  static const String id = 'favorite_info_id';
  static const String favoriteType = 'favorite_type';
  static const String infoId = 'favorite_info_foreign_id';
  static const String userId = 'favorite_user_id';
}

abstract class FavoriteDao {
  Future insertFavoritesCrossRef(
      String userId, FavoriteType type, List<String> ids);

  Future<List<MediaEntity>> getFavoriteMedia(
      MediaType type, String userId, int page, int perPage);

  Future<List<CharacterEntity>> getFavoriteCharacters(
      String userId, int page, int perPage);

  Future<List<StaffEntity>> getFavoriteStaffs(
      String userId, int page, int perPage);
}

class FavoriteDaoImpl extends FavoriteDao {
  final AniflowDatabase database;

  FavoriteDaoImpl(this.database);

  @override
  Future insertFavoritesCrossRef(
      String userId, FavoriteType type, List<String> ids) async {
    final batch = database.aniflowDB.batch();
    for (final id in ids) {
      batch.insert(
        Tables.favoriteInfoTable,
        {
          FavoriteInfoTableColumn.favoriteType: type.contentValues,
          FavoriteInfoTableColumn.infoId: id,
          FavoriteInfoTableColumn.userId: userId,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return batch.commit(noResult: true);
  }

  @override
  Future<List<MediaEntity>> getFavoriteMedia(
      MediaType type, String userId, int page, int perPage) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final favoriteValue = type == MediaType.manga
        ? FavoriteType.manga.contentValues
        : FavoriteType.anime.contentValues;
    final sql = 'select * from ${Tables.favoriteInfoTable} '
        'join ${Tables.mediaTable} '
        '  on ${FavoriteInfoTableColumn.infoId} = ${MediaTableColumns.id} '
        'where ${FavoriteInfoTableColumn.userId} = \'$userId\' '
        '  and ${FavoriteInfoTableColumn.favoriteType} = \'$favoriteValue\' '
        'limit $limit '
        'offset $offset ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);

    return result.map((e) => MediaEntity.fromJson(e)).toList();
  }

  @override
  Future<List<CharacterEntity>> getFavoriteCharacters(
      String userId, int page, int perPage) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final sql = 'select * from ${Tables.favoriteInfoTable} '
        'join ${Tables.characterTable} '
        '  on ${FavoriteInfoTableColumn.infoId} = ${CharacterColumns.id} '
        'where ${FavoriteInfoTableColumn.userId} = \'$userId\' '
        '  and ${FavoriteInfoTableColumn.favoriteType} = \'${FavoriteType.character.contentValues}\' '
        'limit $limit '
        'offset $offset ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);

    return result.map((e) => CharacterEntity.fromJson(e)).toList();
  }

  @override
  Future<List<StaffEntity>> getFavoriteStaffs(
      String userId, int page, int perPage) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final sql = 'select * from ${Tables.favoriteInfoTable} '
        'join ${Tables.staffTable} '
        '  on ${FavoriteInfoTableColumn.infoId} = ${StaffColumns.id} '
        'where ${FavoriteInfoTableColumn.userId} = \'$userId\' '
        '  and ${FavoriteInfoTableColumn.favoriteType} = \'${FavoriteType.staff.contentValues}\' '
        'limit $limit '
        'offset $offset ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);

    return result.map((e) => StaffEntity.fromJson(e)).toList();
  }
}
