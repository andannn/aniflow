import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_charaters_and_voice_actors.dart';
import 'package:anime_tracker/core/database/model/voice_actor_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';

/// [Tables.animeTable]
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

/// [Tables.categoryTable]
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

/// [Tables.animeCategoryCrossRefTable]
mixin AnimeCategoryCrossRefColumns {
  static const String animeId = 'anime_category_cross_anime_id';
  static const String categoryId = 'anime_category_cross_category_id';
}

/// [Tables.characterTable]
mixin CharacterColumns {
  static const String id = 'character_id';
  static const String voiceActorId = 'character_voice_actor_id';
  static const String image = 'character_image';
  static const String nameEnglish = 'character_name_english';
  static const String nameNative = 'character_name_native';
}

/// [Tables.voiceActorTable]
mixin VoiceActorColumns {
  static const String id = 'voice_actor_id';
  static const String image = 'voice_actor_image';
  static const String nameEnglish = 'voice_actor_name_english';
  static const String nameNative = 'voice_actor_name_native';
}

/// [Tables.animeCharacterCrossRefTable]
mixin AnimeCharacterCrossRefColumns {
  static const String animeId = 'anime_character_cross_anime_id';
  static const String characterId = 'anime_character_cross_character_id';
}

class AnimeCharacterCrossRef {
  AnimeCharacterCrossRef(this.animeId, this.characterId);

  final String animeId;
  final String characterId;
}

abstract class AnimeListDao {
  Future clearAll();

  Future<List<AnimeEntity>> getAnimeByPage(AnimeCategory category,
      {required int page, int perPage = defaultPerPageCount});

  Future<AnimeCharactersAndVoiceActors> getDetailAnimeInfo(String id);

  Future upsertByAnimeCategory(AnimeCategory category,
      {required List<AnimeEntity> animeList});

  Future upsertDetailAnimeInfo(List<AnimeEntity> entities);

  Future upsertCharacterInfo(List<CharacterEntity> entities);

  Future upsertVoiceActorInfo(List<VoiceActorEntity> entities);

  Future upsertAnimeCharacterCrossRef(
      {required List<AnimeCharacterCrossRef> crossRefs});
}

class AnimeDaoImpl extends AnimeListDao {
  final AnimeDatabase database;

  AnimeDaoImpl(this.database);

  @override
  Future clearAll() async {
    await database.animeDB.delete(Tables.animeTable);
    await database.animeDB.delete(Tables.categoryTable);
    await database.animeDB.delete(Tables.animeCategoryCrossRefTable);
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
        Tables.animeCategoryCrossRefTable,
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
      join ${Tables.animeCategoryCrossRefTable} as ac
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
  Future upsertDetailAnimeInfo(List<AnimeEntity> entities) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.animeTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertCharacterInfo(List<CharacterEntity> entities) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.characterTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertVoiceActorInfo(List<VoiceActorEntity> entities) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.voiceActorTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertAnimeCharacterCrossRef(
      {required List<AnimeCharacterCrossRef> crossRefs}) async {
    final batch = database.animeDB.batch();
    for (final crossRef in crossRefs) {
      batch.insert(
        Tables.animeCharacterCrossRefTable,
        {
          AnimeCharacterCrossRefColumns.animeId: crossRef.animeId,
          AnimeCharacterCrossRefColumns.characterId: crossRef.characterId,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<AnimeCharactersAndVoiceActors> getDetailAnimeInfo(String id) async {
    final animeJson = await database.animeDB.query(
      Tables.animeTable,
      where: '${AnimeTableColumns.id}=$id',
      limit: 1,
    );
    final animeEntity = AnimeEntity.fromJson(animeJson.first);

    final sql = '''
      select * from ${Tables.characterTable} as c
      join ${Tables.animeCharacterCrossRefTable} as ac
      on c.${CharacterColumns.id} = ac.${AnimeCharacterCrossRefColumns.characterId}
      join ${Tables.voiceActorTable} as v
      on c.${CharacterColumns.voiceActorId} = v.${VoiceActorColumns.id}
      where ac.${AnimeCharacterCrossRefColumns.animeId} = '$id'
    ''';

    List results = await database.animeDB.rawQuery(sql);
    return AnimeCharactersAndVoiceActors(
        animeEntity: animeEntity,
        characterAndVoiceActors: results
            .map(
              (e) => CharacterAndVoiceActor(
                characterEntity: CharacterEntity.fromJson(e),
                voiceActorEntity: VoiceActorEntity.fromJson(e),
              ),
            )
            .toList());
  }
}
