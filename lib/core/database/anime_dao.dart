import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';

mixin AnimeTableColumns {
  static const String id = 'id';
  static const String englishTitle = 'english_title';
  static const String romajiTitle = 'romaji_title';
  static const String nativeTitle = 'native_title';
  static const String coverImage = 'cover_image';
  static const String coverImageColor = 'cover_image_color';
}

abstract class AnimeListDao {
  Future<List<ShortcutAnimeEntity>> getAnimeByPage(String fromTable,
      {required int page, int perPage = defaultPerPageCount});

  Future clearAll(String fromTable);

  Future upsertAll(String fromTable,
      {required List<ShortcutAnimeEntity> animeList});
}

class AnimeDaoImpl extends AnimeListDao {
  final AnimeDatabase database;

  AnimeDaoImpl(this.database);

  @override
  Future clearAll(String fromTable) async {
    await database.animeDB.delete(fromTable);
  }

  @override
  Future upsertAll(String fromTable,
      {required List<ShortcutAnimeEntity> animeList}) async {
    final batch = database.animeDB.batch();

    for (var anime in animeList) {
      batch.insert(fromTable, anime.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<List<ShortcutAnimeEntity>> getAnimeByPage(String fromTable,
      {required int page, int perPage = defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final List<Map<String, dynamic>> result = await database.animeDB
        .query(fromTable, limit: limit, offset: offset);
    return result.map((e) => ShortcutAnimeEntity.fromJson(e)).toList();
  }
}
