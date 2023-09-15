import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';

mixin AnimeTableColumns {
  static const String id = 'id';
  static const String englishTitle = 'english_title';
  static const String romajiTitle = 'romaji_title';
  static const String nativeTitle = 'native_title';
  static const String coverImage = 'cover_image';
  static const String coverImageColor = 'cover_image_color';
  static const String description = 'description';
  static const String source = 'source';
  static const String bannerImage = 'banner_image';
  static const String averageScore = 'average_score';
  static const String trending = 'trending';
  static const String favourites = 'favourites';
}

mixin CategoryColumns {
  static const String category = 'category';
}

mixin CategoryColumnsValues {
  static const String trending = 'trending';
  static const String currentSeason = 'currentSeason';
  static const String nextSeason = 'nextSeason';
}

extension on AnimeCategory {
  String getContentValue() {
    switch (this) {
      case AnimeCategory.trending:
        return CategoryColumnsValues.trending;
      case AnimeCategory.currentSeason:
        return CategoryColumnsValues.currentSeason;
      case AnimeCategory.nextSeason:
        return CategoryColumnsValues.nextSeason;
    }
  }
}

mixin AnimeCategoryCrossRefColumns {
  static const String animeId = 'anime_id';
  static const String categoryId = 'category_id';
}

abstract class AnimeListDao {
  Future<List<AnimeEntity>> getAnimeByPage(AnimeCategory category,
      {required int page, int perPage = defaultPerPageCount});

  Future clearAll();

  Future upsertByAnimeCategory(AnimeCategory category,
      {required List<AnimeEntity> animeList});

  Future upsertDetailAnimeInfo(AnimeEntity entity);
}

class AnimeDaoImpl extends AnimeListDao {
  final AnimeDatabase database;

  AnimeDaoImpl(this.database);

  @override
  Future clearAll() async {
    await database.animeDB.delete(Tables.animeTable);
    await database.animeDB.delete(Tables.categoryTable);
    await database.animeDB.delete(Tables.animeCategoryTable);
  }

  @override
  Future upsertByAnimeCategory(AnimeCategory category,
      {required List<AnimeEntity> animeList}) async {
    final batch = database.animeDB.batch();

    batch.insert(Tables.categoryTable,
        {CategoryColumns.category: category.getContentValue()},
        conflictAlgorithm: ConflictAlgorithm.ignore);

    for (var anime in animeList) {
      batch.insert(
        Tables.animeTable,
        anime.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      batch.insert(
        Tables.animeCategoryTable,
        {
          AnimeCategoryCrossRefColumns.categoryId: category.getContentValue(),
          AnimeCategoryCrossRefColumns.animeId: anime.id,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<List<AnimeEntity>> getAnimeByPage(AnimeCategory category,
      {required int page, int perPage = defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    String sql = '''
      select * from ${Tables.animeTable} as a
      join ${Tables.animeCategoryTable} as ac
      on a.${AnimeTableColumns.id} = ac.${AnimeCategoryCrossRefColumns.animeId}
      where ac.${AnimeCategoryCrossRefColumns.categoryId} = '${category.getContentValue()}'
      limit $limit
      offset $offset
    ''';
    final List<Map<String, dynamic>> result =
        await database.animeDB.rawQuery(sql);
    return result.map((e) => AnimeEntity.fromJson(e)).toList();
  }

  @override
  Future upsertDetailAnimeInfo(AnimeEntity entity) async {
    final batch = database.animeDB.batch();
    batch.insert(
      Tables.animeTable,
      entity.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return await batch.commit(noResult: true);
  }
}
