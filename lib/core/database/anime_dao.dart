import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/common/util/stream_util.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/airing_schedules_entity.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/media_external_link_entity.dart';
import 'package:anime_tracker/core/database/model/relations/airing_schedule_and_anime.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_detail_info.dart';
import 'package:anime_tracker/core/database/model/staff_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.animeTable]
mixin AnimeTableColumns {
  static const String id = 'id';
  static const String englishTitle = 'english_title';
  static const String romajiTitle = 'romaji_title';
  static const String nativeTitle = 'native_title';
  static const String coverImage = 'cover_image';
  static const String coverImageColor = 'cover_image_color';
  static const String description = 'description';
  static const String episodes = 'episodes';
  static const String seasonYear = 'season_year';
  static const String season = 'season';
  static const String source = 'source';
  static const String status = 'status';
  static const String hashtag = 'hashtag';
  static const String bannerImage = 'banner_image';
  static const String averageScore = 'average_score';
  static const String trending = 'trending';
  static const String favourites = 'favourites';
  static const String trailerId = 'trailer_id';
  static const String trailerSite = 'trailer_site';
  static const String trailerThumbnail = 'trailer_thumbnail';
  static const String genres = 'genres';
  static const String popularRanking = 'popular_ranking';
  static const String ratedRanking = 'rated_ranking';
  static const String nextAiringEpisode = 'nextAiringEpisode';
  static const String timeUntilAiring = 'timeUntilAiring';
}

mixin CategoryColumns {
  static const String category = 'category';
}

/// [Tables.categoryTable]
mixin CategoryColumnsValues {
  static const String trending = 'trending';
  static const String currentSeason = 'currentSeason';
  static const String nextSeason = 'nextSeason';
  static const String movie = 'movie';
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
      case AnimeCategory.movie:
        return CategoryColumnsValues.movie;
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
  static const String role = 'character_role';
  static const String image = 'character_image';
  static const String nameEnglish = 'character_name_english';
  static const String nameNative = 'character_name_native';
}

/// [Tables.staffTable]
mixin StaffColumns {
  static const String id = 'staff_id';
  static const String image = 'staff_image';
  static const String nameEnglish = 'staff_name_english';
  static const String nameNative = 'staff_name_native';
}

/// [Tables.animeCharacterCrossRefTable]
mixin AnimeCharacterCrossRefColumns {
  static const String animeId = 'anime_character_cross_anime_id';
  static const String characterId = 'anime_character_cross_character_id';
}

class AnimeCharacterCrossRef {
  AnimeCharacterCrossRef({required this.animeId, required this.characterId});

  final String animeId;
  final String characterId;
}

/// [Tables.animeStaffCrossRefTable]
mixin AnimeStaffCrossRefColumns {
  static const String animeId = 'anime_staff_cross_anime_id';
  static const String staffId = 'anime_character_cross_staff_id';
  static const String staffRole = 'anime_character_cross_staff_role';
}

/// [Tables.airingSchedulesTable]
mixin AiringSchedulesColumns {
  static const String id = 'airing_schedules_id';
  static const String mediaId = 'airing_schedules_media_id';
  static const String airingAt = 'airing_schedules_airing_at';
  static const String timeUntilAiring = 'airing_schedules_time_until_airing';
  static const String episode = 'airing_schedules_episode';
}

class AnimeStaffCrossRef {
  AnimeStaffCrossRef(
      {required this.animeId, required this.staffId, required this.staffRole});

  final String animeId;
  final String staffId;
  final String staffRole;
}

/// [Tables.mediaExternalLickTable]
mixin MediaExternalLinkColumnValues {
  static const id = 'external_link_id';
  static const animeId = 'external_link_anime_id';
  static const url = 'external_link_url';
  static const site = 'external_link_site';
  static const type = 'external_link_type';
  static const siteId = 'external_link_siteId';
  static const color = 'external_link_color';
  static const icon = 'external_link_icon';
}

abstract class AnimeListDao {
  Future clearAll();

  Future<List<AnimeEntity>> getAnimeByPage(AnimeCategory category,
      {required int page, int perPage = Config.defaultPerPageCount});

  Future<AnimeWithDetailInfo> getDetailAnimeInfo(String id);

  Stream<AnimeWithDetailInfo> getDetailAnimeInfoStream(String id);

  Future insertOrIgnoreAnimeByAnimeCategory(AnimeCategory category,
      {required List<AnimeEntity> animeList});

  Future upsertAnimeInformation(List<AnimeEntity> entities,
      {ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore});

  Future upsertCharacterInfo(List<CharacterEntity> entities);

  Future upsertStaffInfo(List<StaffEntity> entities);

  Future upsertAnimeCharacterCrossRef(
      {required List<AnimeCharacterCrossRef> crossRefs});

  Future upsertAnimeStaffCrossRef(
      {required List<AnimeStaffCrossRef> crossRefs});

  Future upsertAiringSchedules(
      {required List<AiringSchedulesEntity> schedules});

  /// Get airing schedules in time range of [startMs, endMs]
  Future<List<AiringScheduleAndAnime>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange});

  Future clearAiringSchedule();

  Future upsertMediaExternalLinks(
      {required List<MediaExternalLinkEntity> externalLinks});

  void notifyAnimeDetailInfoChanged();

  Future insertCharacterVoiceActors(
      {required int animeId, required List<CharacterAndVoiceActor> entities});
}

class AnimeDaoImpl extends AnimeListDao {
  final AnimeDatabase database;

  AnimeDaoImpl(this.database);

  final detailListChangeSource = ValueNotifier(0);

  @override
  Future clearAll() async {
    await database.animeDB.delete(Tables.animeCategoryCrossRefTable);
  }

  @override
  Future insertOrIgnoreAnimeByAnimeCategory(AnimeCategory category,
      {required List<AnimeEntity> animeList}) async {
    final batch = database.animeDB.batch();

    batch.insert(Tables.categoryTable,
        {CategoryColumns.category: category.getContentValue()},
        conflictAlgorithm: ConflictAlgorithm.ignore);

    for (var anime in animeList) {
      batch.insert(
        Tables.animeTable,
        anime.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
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
      {required int page, int perPage = Config.defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    String characterSql = 'select * from ${Tables.animeTable} as a '
        'join ${Tables.animeCategoryCrossRefTable} as ac '
        'on a.${AnimeTableColumns.id} = ac.${AnimeCategoryCrossRefColumns.animeId} '
        'where ac.${AnimeCategoryCrossRefColumns.categoryId} = \'${category.getContentValue()}\' '
        'limit $limit '
        'offset $offset ';

    final List<Map<String, dynamic>> result =
        await database.animeDB.rawQuery(characterSql);
    return result.map((e) => AnimeEntity.fromJson(e)).toList();
  }

  @override
  Future<AnimeWithDetailInfo> getDetailAnimeInfo(String id) async {
    final animeJson = await database.animeDB.query(
      Tables.animeTable,
      where: '${AnimeTableColumns.id}=$id',
      limit: 1,
    );
    final animeEntity = AnimeEntity.fromJson(animeJson.first);

    final characterSql = 'select * from ${Tables.characterTable} as c '
        'join ${Tables.animeCharacterCrossRefTable} as ac '
        '  on c.${CharacterColumns.id} = ac.${AnimeCharacterCrossRefColumns.characterId} '
        'join ${Tables.staffTable} as v '
        '  on c.${CharacterColumns.voiceActorId} = v.${StaffColumns.id} '
        'where ac.${AnimeCharacterCrossRefColumns.animeId} = \'$id\' ';
    List characterResults = await database.animeDB.rawQuery(characterSql);

    String staffSql = 'select * from ${Tables.staffTable} as s '
        'join ${Tables.animeStaffCrossRefTable} as animeStaff '
        '  on s.${StaffColumns.id} = animeStaff.${AnimeStaffCrossRefColumns.staffId} '
        'where animeStaff.${AnimeStaffCrossRefColumns.animeId} = \'$id\' ';
    List staffResults = await database.animeDB.rawQuery(staffSql);

    String externalLinkSql =
        'select * from ${Tables.mediaExternalLickTable} as media '
        'where media.${MediaExternalLinkColumnValues.animeId} = \'$id\' ';
    List externalLinkResults = await database.animeDB.rawQuery(externalLinkSql);

    return AnimeWithDetailInfo(
      animeEntity: animeEntity,
      characterAndVoiceActors: characterResults
          .map(
            (e) => CharacterAndVoiceActor(
              characterEntity: CharacterEntity.fromJson(e),
              voiceActorEntity: StaffEntity.fromJson(e),
            ),
          )
          .toList(),
      staffs: staffResults
          .map(
            (e) => StaffAndRoleEntity.fromJson(e),
          )
          .toList(),
      externalLinks: externalLinkResults
          .map((e) => MediaExternalLinkEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  Future upsertAnimeInformation(List<AnimeEntity> entities,
      {ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore}) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.animeTable,
        entity.toJson(),
        conflictAlgorithm: conflictAlgorithm,
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
  Future upsertStaffInfo(List<StaffEntity> entities) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.staffTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertAnimeCharacterCrossRef({
    required List<AnimeCharacterCrossRef> crossRefs,
  }) async {
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
  Future upsertAnimeStaffCrossRef(
      {required List<AnimeStaffCrossRef> crossRefs}) async {
    final batch = database.animeDB.batch();
    for (final crossRef in crossRefs) {
      batch.insert(
        Tables.animeStaffCrossRefTable,
        {
          AnimeStaffCrossRefColumns.animeId: crossRef.animeId,
          AnimeStaffCrossRefColumns.staffId: crossRef.staffId,
          AnimeStaffCrossRefColumns.staffRole: crossRef.staffRole,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertAiringSchedules(
      {required List<AiringSchedulesEntity> schedules}) async {
    final batch = database.animeDB.batch();
    for (final schedule in schedules) {
      batch.insert(
        Tables.airingSchedulesTable,
        schedule.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertMediaExternalLinks(
      {required List<MediaExternalLinkEntity> externalLinks}) async {
    final batch = database.animeDB.batch();
    for (final externalLink in externalLinks) {
      batch.insert(
        Tables.mediaExternalLickTable,
        externalLink.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<List<AiringScheduleAndAnime>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange}) async {
    final (startMs, endMs) = timeRange;
    final (startSecond, endSecond) = (startMs ~/ 1000, endMs ~/ 1000);

    final sql = 'select * from ${Tables.airingSchedulesTable} as air '
        'join ${Tables.animeTable} as anime '
        '  on air.${AiringSchedulesColumns.mediaId} = anime.${AnimeTableColumns.id} '
        'where air.${AiringSchedulesColumns.airingAt} >= $startSecond '
        '  and air.${AiringSchedulesColumns.airingAt} < $endSecond '
        'order by air.${AiringSchedulesColumns.airingAt} asc ';

    List results = await database.animeDB.rawQuery(sql);

    return results
        .map(
          (e) => AiringScheduleAndAnime(
            airingSchedule: AiringSchedulesEntity.fromJson(e),
            anime: AnimeEntity.fromJson(e),
          ),
        )
        .toList();
  }

  @override
  Stream<AnimeWithDetailInfo> getDetailAnimeInfoStream(String id) {
    return StreamUtil.createStream(
      detailListChangeSource,
      () => getDetailAnimeInfo(id),
    );
  }

  @override
  void notifyAnimeDetailInfoChanged() {
    detailListChangeSource.value = detailListChangeSource.value++;
  }

  @override
  Future clearAiringSchedule() {
    return database.animeDB.delete(Tables.airingSchedulesTable);
  }

  @override
  Future insertCharacterVoiceActors(
      {required int animeId,
      required List<CharacterAndVoiceActor> entities}) async {
    final batch = database.animeDB.batch();
    for (final entity in entities) {
      if (entity.voiceActorEntity != null) {
        batch.insert(
          Tables.staffTable,
          entity.voiceActorEntity!.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      batch.insert(
        Tables.characterTable,
        entity.characterEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      batch.insert(
        Tables.animeCharacterCrossRefTable,
        {
          AnimeCharacterCrossRefColumns.animeId: animeId,
          AnimeCharacterCrossRefColumns.characterId: entity.characterEntity.id,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }
}
