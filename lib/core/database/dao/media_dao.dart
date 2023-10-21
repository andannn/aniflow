// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/airing_schedules_entity.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_external_link_entity.dart';
import 'package:aniflow/core/database/model/relations/airing_schedule_and_media_relation.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/model/relations/media_with_detail_info.dart';
import 'package:aniflow/core/database/model/relations/staff_and_role_relation.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.mediaTable]
mixin MediaTableColumns {
  static const String id = 'id';
  static const String type = 'media_type';
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
  static const String currentSeason = 'current_season';
  static const String nextSeason = 'next_season';
  static const String movie = 'movie';
  static const String trendingManga = 'trending_manga';
  static const String allTimePopularManga = 'all_time_popular_manga';
  static const String topManhwa = 'top_manhwa';
}

extension on MediaCategory {
  String getContentValue() {
    switch (this) {
      case MediaCategory.trendingAnime:
        return CategoryColumnsValues.trending;
      case MediaCategory.currentSeasonAnime:
        return CategoryColumnsValues.currentSeason;
      case MediaCategory.nextSeasonAnime:
        return CategoryColumnsValues.nextSeason;
      case MediaCategory.movieAnime:
        return CategoryColumnsValues.movie;
      case MediaCategory.trendingManga:
        return CategoryColumnsValues.trendingManga;
      case MediaCategory.allTimePopularManga:
        return CategoryColumnsValues.allTimePopularManga;
      case MediaCategory.topManhwa:
        return CategoryColumnsValues.topManhwa;
    }
  }
}

/// [Tables.animeCategoryCrossRefTable]
mixin MediaCategoryCrossRefColumns {
  static const String mediaId = 'anime_category_cross_media_id';
  static const String categoryId = 'anime_category_cross_category_id';
  static const String timeStamp = 'anime_category_cross_time_stamp';
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

/// [Tables.mediaCharacterCrossRefTable]
mixin MediaCharacterCrossRefColumns {
  static const String mediaId = 'media_character_cross_anime_id';
  static const String characterId = 'media_character_cross_character_id';
  static const String timeStamp = 'media_character_cross_time_stamp';
}

class AnimeCharacterCrossRef {
  AnimeCharacterCrossRef({required this.animeId, required this.characterId});

  final String animeId;
  final String characterId;
}

/// [Tables.mediaStaffCrossRefTable]
mixin MediaStaffCrossRefColumns {
  static const String mediaId = 'media_staff_cross_anime_id';
  static const String staffId = 'media_staff_cross_staff_id';
  static const String staffRole = 'media_staff_cross_staff_role';
  static const String timeStamp = 'media_staff_cross_timeStamp';
}

/// [Tables.airingSchedulesTable]
mixin AiringSchedulesColumns {
  static const String id = 'airing_schedules_id';
  static const String mediaId = 'airing_schedules_media_id';
  static const String airingAt = 'airing_schedules_airing_at';
  static const String timeUntilAiring = 'airing_schedules_time_until_airing';
  static const String episode = 'airing_schedules_episode';
}

/// [Tables.mediaExternalLickTable]
mixin MediaExternalLinkColumnValues {
  static const id = 'external_link_id';
  static const mediaId = 'external_link_media_id';
  static const url = 'external_link_url';
  static const site = 'external_link_site';
  static const type = 'external_link_type';
  static const siteId = 'external_link_siteId';
  static const color = 'external_link_color';
  static const icon = 'external_link_icon';
}

abstract class MediaInformationDao {
  Future clearAnimeCategoryCrossRef(MediaCategory category);

  Future<List<MediaEntity>> getMediaByPage(MediaCategory category,
      {required int page, int perPage = Config.defaultPerPageCount});

  Future<MediaWithDetailInfo> getDetailMediaInfo(String id);

  Future<List<CharacterAndVoiceActorRelation>> getCharacterOfMediaByPage(String animeId,
      {required int page, int perPage = Config.defaultPerPageCount});

  Future<List<StaffAndRoleRelation>> getStaffOfMediaByPage(String animeId,
      {required int page, int perPage = Config.defaultPerPageCount});

  Stream<MediaWithDetailInfo> getDetailMediaInfoStream(String id);

  Future insertOrIgnoreMediaByAnimeCategory(MediaCategory category,
      {required List<MediaEntity> animeList});

  Future upsertMediaInformation(List<MediaEntity> entities,
      {ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore});

  Future upsertStaffInfo(List<StaffEntity> entities);

  Future upsertAiringSchedules(
      {required List<AiringSchedulesEntity> schedules});

  /// Get airing schedules in time range of [startMs, endMs]
  Future<List<AiringScheduleAndMediaRelation>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange});

  Future clearAiringSchedule();

  Future upsertMediaExternalLinks(
      {required List<MediaExternalLinkEntity> externalLinks});

  void notifyMediaDetailInfoChanged();

  Future insertCharacterVoiceActors(
      {required int mediaId, required List<CharacterAndVoiceActorRelation> entities});

  Future clearMediaCharacterCrossRef(String mediaId);

  Future insertStaffEntities(
      {required int mediaId, required List<StaffAndRoleRelation> entities});
}

class MediaInformationDaoImpl extends MediaInformationDao {
  final AniflowDatabase database;

  MediaInformationDaoImpl(this.database);

  final detailListChangeSource = ValueNotifier(0);

  @override
  Future clearAnimeCategoryCrossRef(MediaCategory category) async {
    await database.aniflowDB.delete(
      Tables.animeCategoryCrossRefTable,
      where: '${MediaCategoryCrossRefColumns.categoryId} = ?',
      whereArgs: [category.getContentValue()],
    );
  }

  @override
  Future clearMediaCharacterCrossRef(String mediaId) async {
    await database.aniflowDB.delete(
      Tables.mediaCharacterCrossRefTable,
      where: '${MediaCharacterCrossRefColumns.mediaId} = ?',
      whereArgs: [mediaId.toString()],
    );
  }

  @override
  Future insertOrIgnoreMediaByAnimeCategory(MediaCategory category,
      {required List<MediaEntity> animeList}) async {
    final batch = database.aniflowDB.batch();

    batch.insert(Tables.categoryTable,
        {CategoryColumns.category: category.getContentValue()},
        conflictAlgorithm: ConflictAlgorithm.ignore);

    for (var anime in animeList) {
      batch.insert(
        Tables.mediaTable,
        anime.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      batch.insert(
        Tables.animeCategoryCrossRefTable,
        {
          MediaCategoryCrossRefColumns.categoryId: category.getContentValue(),
          MediaCategoryCrossRefColumns.mediaId: anime.id,
          MediaCategoryCrossRefColumns.timeStamp:
              DateTime.now().microsecondsSinceEpoch,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<List<MediaEntity>> getMediaByPage(MediaCategory category,
      {required int page, int perPage = Config.defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    String characterSql = 'select * from ${Tables.mediaTable} as a '
        'join ${Tables.animeCategoryCrossRefTable} as ac '
        'on a.${MediaTableColumns.id} = ac.${MediaCategoryCrossRefColumns.mediaId} '
        'where ac.${MediaCategoryCrossRefColumns.categoryId} = \'${category.getContentValue()}\' '
        'order by ${MediaCategoryCrossRefColumns.timeStamp} asc '
        'limit $limit '
        'offset $offset ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(characterSql);
    return result.map((e) => MediaEntity.fromJson(e)).toList();
  }

  @override
  Future<List<CharacterAndVoiceActorRelation>> getCharacterOfMediaByPage(String animeId,
      {required int page, int perPage = Config.defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final characterSql = 'select * from ${Tables.characterTable} as c '
        'join ${Tables.mediaCharacterCrossRefTable} as ac '
        '  on c.${CharacterColumns.id} = ac.${MediaCharacterCrossRefColumns.characterId} '
        'left join ${Tables.staffTable} as v '
        '  on c.${CharacterColumns.voiceActorId} = v.${StaffColumns.id} '
        'where ac.${MediaCharacterCrossRefColumns.mediaId} = \'$animeId\' '
        'order by ${MediaCharacterCrossRefColumns.timeStamp} asc '
        'limit $limit '
        'offset $offset ';
    List characterResults = await database.aniflowDB.rawQuery(characterSql);
    return characterResults
        .map(
          (e) => CharacterAndVoiceActorRelation(
            characterEntity: CharacterEntity.fromJson(e),
            voiceActorEntity: StaffEntity.fromJson(e),
          ),
        )
        .toList();
  }

  @override
  Future<List<StaffAndRoleRelation>> getStaffOfMediaByPage(String animeId,
      {required int page, int perPage = Config.defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    String staffSql = 'select * from ${Tables.staffTable} as s '
        'join ${Tables.mediaStaffCrossRefTable} as animeStaff '
        '  on s.${StaffColumns.id} = animeStaff.${MediaStaffCrossRefColumns.staffId} '
        'where animeStaff.${MediaStaffCrossRefColumns.mediaId} = \'$animeId\' '
        'order by ${MediaStaffCrossRefColumns.timeStamp} asc '
        'limit $limit '
        'offset $offset ';

    List staffResults = await database.aniflowDB.rawQuery(staffSql);
    return staffResults.map((e) => StaffAndRoleRelation.fromJson(e)).toList();
  }

  @override
  Future<MediaWithDetailInfo> getDetailMediaInfo(String id) async {
    final animeJson = await database.aniflowDB.query(
      Tables.mediaTable,
      where: '${MediaTableColumns.id}=$id',
      limit: 1,
    );
    final animeEntity = MediaEntity.fromJson(animeJson.first);

    final characterResults = await getCharacterOfMediaByPage(id, page: 1);

    final staffResults = await getStaffOfMediaByPage(id, page: 1);

    String externalLinkSql =
        'select * from ${Tables.mediaExternalLickTable} as media '
        'where media.${MediaExternalLinkColumnValues.mediaId} = \'$id\' ';
    List externalLinkResults = await database.aniflowDB.rawQuery(externalLinkSql);

    return MediaWithDetailInfo(
      mediaEntity: animeEntity,
      characterAndVoiceActors: characterResults,
      staffs: staffResults,
      externalLinks: externalLinkResults
          .map((e) => MediaExternalLinkEntity.fromJson(e))
          .toList(),
    );
  }

  @override
  Future upsertMediaInformation(List<MediaEntity> entities,
      {ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore}) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.mediaTable,
        entity.toJson(),
        conflictAlgorithm: conflictAlgorithm,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future upsertStaffInfo(List<StaffEntity> entities) async {
    final batch = database.aniflowDB.batch();
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
  Future upsertAiringSchedules(
      {required List<AiringSchedulesEntity> schedules}) async {
    final batch = database.aniflowDB.batch();
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
    final batch = database.aniflowDB.batch();
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
  Future<List<AiringScheduleAndMediaRelation>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange}) async {
    final (startMs, endMs) = timeRange;
    final (startSecond, endSecond) = (startMs ~/ 1000, endMs ~/ 1000);

    final sql = 'select * from ${Tables.airingSchedulesTable} as air '
        'join ${Tables.mediaTable} as anime '
        '  on air.${AiringSchedulesColumns.mediaId} = anime.${MediaTableColumns.id} '
        'where air.${AiringSchedulesColumns.airingAt} >= $startSecond '
        '  and air.${AiringSchedulesColumns.airingAt} < $endSecond '
        'order by air.${AiringSchedulesColumns.airingAt} asc ';

    List results = await database.aniflowDB.rawQuery(sql);

    return results
        .map(
          (e) => AiringScheduleAndMediaRelation(
            airingSchedule: AiringSchedulesEntity.fromJson(e),
            mediaEntity: MediaEntity.fromJson(e),
          ),
        )
        .toList();
  }

  @override
  Stream<MediaWithDetailInfo> getDetailMediaInfoStream(String id) {
    return StreamUtil.createStream(
      detailListChangeSource,
      () => getDetailMediaInfo(id),
    );
  }

  @override
  void notifyMediaDetailInfoChanged() {
    detailListChangeSource.value = detailListChangeSource.value++;
  }

  @override
  Future clearAiringSchedule() {
    return database.aniflowDB.delete(Tables.airingSchedulesTable);
  }

  @override
  Future insertCharacterVoiceActors(
      {required int mediaId,
      required List<CharacterAndVoiceActorRelation> entities}) async {
    final batch = database.aniflowDB.batch();
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
        Tables.mediaCharacterCrossRefTable,
        {
          MediaCharacterCrossRefColumns.mediaId: mediaId,
          MediaCharacterCrossRefColumns.characterId: entity.characterEntity.id,
          MediaCharacterCrossRefColumns.timeStamp:
              DateTime.now().microsecondsSinceEpoch,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future insertStaffEntities(
      {required int mediaId,
      required List<StaffAndRoleRelation> entities}) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.staffTable,
        entity.staff.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      batch.insert(
        Tables.mediaStaffCrossRefTable,
        {
          MediaStaffCrossRefColumns.mediaId: mediaId,
          MediaStaffCrossRefColumns.staffId: entity.staff.id,
          MediaStaffCrossRefColumns.staffRole: entity.role,
          MediaStaffCrossRefColumns.timeStamp:
              DateTime.now().microsecondsSinceEpoch,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }
}
