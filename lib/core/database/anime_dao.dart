import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../data/repository/ani_list_repository.dart';

mixin AnimeTableColumns {
  static const String id = 'id';
  static const String englishTitle = 'english_title';
  static const String romajiTitle = 'romaji_title';
  static const String nativeTitle = 'native_title';
  static const String coverImage = 'cover_image';
  static const String coverImageColor = 'cover_image_color';
}

abstract class AnimeDao {
  Future<List<ShortcutAnimeEntity>> getCurrentSeasonAnimeByPage(
      {required int page, int perPage = defaultPerPageCount});

  Future clearAll();

  Future upsertAll(List<ShortcutAnimeEntity> animeList);
}

class AnimeDaoImpl extends AnimeDao {
  final AnimeDatabase database;

  AnimeDaoImpl(this.database);

  @override
  Future clearAll() async {
    await database.animeDB.delete(Tables.animeTable);
  }

  @override
  Future upsertAll(List<ShortcutAnimeEntity> animeList) async {
    final batch = database.animeDB.batch();

    for (var anime in animeList) {
      batch.insert(Tables.animeTable, anime.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return await batch.commit();
  }

  @override
  Future<List<ShortcutAnimeEntity>> getCurrentSeasonAnimeByPage(
      {required int page, int perPage = defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final List<Map<String, dynamic>> result = await database.animeDB
        .query(Tables.animeTable, limit: limit, offset: offset);
    return result.map((e) => ShortcutAnimeEntity.fromJson(e)).toList();
  }
}
