// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/common/model/media_relation.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_external_link_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/model/relations/media_relation_entities_with_owner_id.dart';
import 'package:aniflow/core/database/model/relations/media_with_detail_info.dart';
import 'package:aniflow/core/database/model/relations/staff_and_role_relation.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:aniflow/core/database/model/studio_entity.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
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
  static const String isFavourite = 'isFavourite';
  static const String genres = 'genres';
  static const String popularRanking = 'popular_ranking';
  static const String ratedRanking = 'rated_ranking';
  static const String nextAiringEpisode = 'next_airing_episode';
  static const String timeUntilAiring = 'time_until_airing';
  static const String startDate = 'start_date';
  static const String endDate = 'end_date';
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

/// [Tables.animeCategoryCrossRefTable]
mixin MediaCategoryCrossRefColumns {
  static const String mediaId = 'anime_category_cross_media_id';
  static const String categoryId = 'anime_category_cross_category_id';
  static const String timeStamp = 'anime_category_cross_time_stamp';
}

/// [Tables.characterVoiceActorCrossRefTable]
mixin CharacterVoiceActorCrossRefColumns {
  static const String id = 'character_voice_actor_cross_id';
  static const String characterId = 'character_voice_actor_cross_character_id';
  static const String staffId = 'character_voice_actor_cross_staff_id';
  static const String role = 'character_voice_actor_cross_role';
  static const String language = 'character_voice_actor_cross_language';
}

/// [Tables.mediaCharacterCrossRefTable]
mixin MediaCharacterCrossRefColumns {
  static const String mediaId = 'media_character_cross_anime_id';
  static const String characterId = 'media_character_cross_character_id';
  static const String timeStamp = 'media_character_cross_time_stamp';
}

/// [Tables.mediaStaffCrossRefTable]
mixin MediaStaffCrossRefColumns {
  static const String mediaId = 'media_staff_cross_anime_id';
  static const String staffId = 'media_staff_cross_staff_id';
  static const String staffRole = 'media_staff_cross_staff_role';
  static const String timeStamp = 'media_staff_cross_timeStamp';
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

/// [Tables.mediaRelationCrossRef]
mixin MediaRelationCrossRefColumnValues {
  static const String ownerId = 'media_relation_cross_ref_owner_media_id';
  static const String relationId = 'media_relation_cross_ref_relation_media_id';
  static const String relationType = 'media_staff_cross_ref_relation_type';
}

class MediaRelationCrossRef {
  MediaRelationCrossRef(this.ownerId, this.relationId, this.relationType);

  final String ownerId;
  final String relationId;
  final MediaRelation relationType;
}

abstract class MediaInformationDao {
  Future clearAnimeCategoryCrossRef(MediaCategory category);

  Future<List<MediaEntity>> getMediaByPage(MediaCategory category,
      {required int page, int perPage = AfConfig.defaultPerPageCount});

  Future<MediaEntity> getMedia(String id);

  Future<MediaWithDetailInfo> getDetailMediaInfo(String id);

  Future<List<CharacterAndVoiceActorRelationEntity>> getCharacterOfMediaByPage(
      String animeId,
      {required int page,
      StaffLanguage staffLanguage = StaffLanguage.japanese,
      int perPage = AfConfig.defaultPerPageCount});

  Future<List<StaffAndRoleRelation>> getStaffOfMediaByPage(String animeId,
      {required int page, int perPage = AfConfig.defaultPerPageCount});

  Stream<MediaWithDetailInfo> getDetailMediaInfoStream(String id);

  Future<List<MediaRelationEntity>> getMediaRelations(String animeId);

  Future insertOrIgnoreMediaByAnimeCategory(MediaCategory category,
      {required List<MediaEntity> animeList});

  Future insertMedia(List<MediaEntity> entities,
      {ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore});

  Future upsertMediaExternalLinks(
      {required List<MediaExternalLinkEntity> externalLinks});

  Future upsertMediaRelations(
      {required MediaRelationEntitiesWithOwnerId relationEntity});

  void notifyMediaDetailInfoChanged();

  Future insertCharacterVoiceActorsOfMedia(
      {required int mediaId,
      required List<CharacterAndVoiceActorRelationEntity> entities});

  Future clearMediaCharacterCrossRef(String mediaId);

  Future insertStaffRelationEntitiesOfMedia(
      {required int mediaId, required List<StaffAndRoleRelation> entities});

  Future<List<StudioEntity>> getStudioOfMedia(String mediaId);
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
      {required int page, int perPage = AfConfig.defaultPerPageCount}) async {
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
  Future<List<CharacterAndVoiceActorRelationEntity>> getCharacterOfMediaByPage(
      String animeId,
      {required int page,
      StaffLanguage staffLanguage = StaffLanguage.japanese,
      int perPage = AfConfig.defaultPerPageCount}) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final characterSql = 'select * from ${Tables.characterTable} as c \n'
        'join ${Tables.mediaCharacterCrossRefTable} as ac '
        '  on c.${CharacterColumns.id} = ac.${MediaCharacterCrossRefColumns.characterId} \n'
        'left join ${Tables.characterVoiceActorCrossRefTable} as cv \n'
        '  on c.${CharacterColumns.id} = cv.${CharacterVoiceActorCrossRefColumns.characterId} \n'
        '    and cv.${CharacterVoiceActorCrossRefColumns.language} = \'${staffLanguage.toJson()}\' \n'
        'left join ${Tables.staffTable} as v \n'
        '  on cv.${CharacterVoiceActorCrossRefColumns.staffId} = v.${StaffColumns.id} \n'
        'where ac.${MediaCharacterCrossRefColumns.mediaId} = \'$animeId\' \n'
        'order by ${MediaCharacterCrossRefColumns.timeStamp} asc \n'
        'limit $limit \n'
        'offset $offset \n';
    List<Map<String, dynamic>> characterResults =
        await database.aniflowDB.rawQuery(characterSql);
    return characterResults
        .map(
          (e) => CharacterAndVoiceActorRelationEntity(
            characterEntity: CharacterEntity.fromJson(e),
            voiceActorEntity: StaffEntity.fromJson(e),
            language: StaffLanguage.fromJson(
                e[CharacterVoiceActorCrossRefColumns.language]),
            role: CharacterRole.fromJson(
                e[CharacterVoiceActorCrossRefColumns.role]),
          ),
        )
        .toList();
  }

  @override
  Future<List<StaffAndRoleRelation>> getStaffOfMediaByPage(String animeId,
      {required int page, int perPage = AfConfig.defaultPerPageCount}) async {
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
  Future<MediaEntity> getMedia(String id) async {
    final animeJson = await database.aniflowDB.query(
      Tables.mediaTable,
      where: '${MediaTableColumns.id}=$id',
      limit: 1,
    );

    return MediaEntity.fromJson(animeJson.first);
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

    final studios = await getStudioOfMedia(id);

    String externalLinkSql =
        'select * from ${Tables.mediaExternalLickTable} as media '
        'where media.${MediaExternalLinkColumnValues.mediaId} = \'$id\' ';
    List externalLinkResults =
        await database.aniflowDB.rawQuery(externalLinkSql);

    final mediaRelations = await getMediaRelations(id);

    return MediaWithDetailInfo(
      mediaEntity: animeEntity,
      characterAndVoiceActors: characterResults,
      staffs: staffResults,
      externalLinks: externalLinkResults
          .map((e) => MediaExternalLinkEntity.fromJson(e))
          .toList(),
      mediaRelations: mediaRelations,
      studios: studios,
    );
  }

  @override
  Future insertMedia(List<MediaEntity> entities,
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
  Future<List<MediaRelationEntity>> getMediaRelations(String animeId) async {
    final sql = 'select * from ${Tables.mediaRelationCrossRef} as mr '
        'join ${Tables.mediaTable} as media '
        '  on mr.${MediaRelationCrossRefColumnValues.relationId} = media.${MediaTableColumns.id} '
        'where mr.${MediaRelationCrossRefColumnValues.ownerId} = $animeId';

    List<Map<String, dynamic>> results = await database.aniflowDB.rawQuery(sql);

    return results
        .map((e) => MediaRelationEntity(
              MediaRelation.fromJson(
                  e[MediaRelationCrossRefColumnValues.relationType]),
              MediaEntity.fromJson(e),
            ))
        .toList();
  }

  @override
  Stream<MediaWithDetailInfo> getDetailMediaInfoStream(String id) {
    return StreamUtil.createStream(
        detailListChangeSource, () => getDetailMediaInfo(id));
  }

  @override
  void notifyMediaDetailInfoChanged() {
    detailListChangeSource.value = detailListChangeSource.value++;
  }

  @override
  Future insertCharacterVoiceActorsOfMedia(
      {required int mediaId,
      required List<CharacterAndVoiceActorRelationEntity> entities}) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      if (entity.voiceActorEntity != null) {
        batch.insert(
          Tables.staffTable,
          entity.voiceActorEntity!.toJson(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      batch.insert(
        Tables.characterTable,
        entity.characterEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
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
      if (entity.voiceActorEntity != null) {
        batch.insert(
          Tables.characterVoiceActorCrossRefTable,
          {
            CharacterVoiceActorCrossRefColumns.characterId:
                entity.characterEntity.id,
            CharacterVoiceActorCrossRefColumns.staffId:
                entity.voiceActorEntity!.id,
            CharacterVoiceActorCrossRefColumns.role: entity.role?.toJson(),
            CharacterVoiceActorCrossRefColumns.language:
                entity.language?.toJson(),
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future insertStaffRelationEntitiesOfMedia(
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

  @override
  Future upsertMediaRelations(
      {required MediaRelationEntitiesWithOwnerId relationEntity}) async {
    final batch = database.aniflowDB.batch();
    for (final media in relationEntity.medias) {
      batch.insert(
        Tables.mediaRelationCrossRef,
        {
          MediaRelationCrossRefColumnValues.ownerId: relationEntity.ownerId,
          MediaRelationCrossRefColumnValues.relationId: media.media.id,
          MediaRelationCrossRefColumnValues.relationType: media.type.toJson(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      batch.insert(
        Tables.mediaTable,
        media.media.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<List<StudioEntity>> getStudioOfMedia(String mediaId) async {
    String sql = 'select * from ${Tables.studioTable} as s '
        'join ${Tables.studioMediaCrossRefTable} as sm '
        'on s.${StudioColumns.id} = sm.${StudioMediaCrossRefColumns.studioId} '
        'where sm.${StudioMediaCrossRefColumns.mediaId} = $mediaId and '
        's.${StudioColumns.isAnimationStudio} = ${true.toInteger()} ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);
    return result.map((e) => StudioEntity.fromJson(e)).toList();
  }
}
