import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_model.dart';
import 'package:sqflite/sqflite.dart';

mixin AnimeTableColumns {
  static const String id = 'id';
  static const String englishTitle = 'english_title';
  static const String romajiTitle = 'romaji_title';
  static const String nativeTitle = 'native_title';
  static const String coverImage = 'cover_image';
  static const String coverImageColor = 'cover_image_color';
}

abstract class AnimeDao {
  static const int defaultPerPage = 10;

  Future<List<AnimeModel>> getCurrentSeasonAnimeByPage(
      {required int page, int perPage = defaultPerPage});

  Future clearAll();

  Future upsertAll(List<AnimeModel> animeList);
}

class AnimeDaoImpl extends AnimeDao {
  final AnimeDatabase database;

  AnimeDaoImpl(this.database);

  @override
  Future clearAll() async {
    await database.animeDB.delete(Tables.animeTable);
  }

  @override
  Future upsertAll(List<AnimeModel> animeList) async {
    final batch = database.animeDB.batch();

    for (var anime in animeList) {
      batch.insert(Tables.animeTable, anime.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return await batch.commit();
  }

  @override
  Future<List<AnimeModel>> getCurrentSeasonAnimeByPage(
      {required int page, int perPage = AnimeDao.defaultPerPage}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final List<Map<String, dynamic>> result = await database.animeDB
        .query(Tables.animeTable, limit: limit, offset: offset);
    return result.map((e) => AnimeModel.fromJson(e)).toList();
  }
}
