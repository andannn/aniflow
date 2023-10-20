// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const databaseFileName = "anime_data_base.db";

mixin Tables {
  static const String mediaTable = 'media_table';
  static const String categoryTable = 'category_table';
  static const String animeCategoryCrossRefTable =
      'anime_category_cross_ref_table';
  static const String characterTable = 'character_table';
  static const String mediaCharacterCrossRefTable =
      'media_character_cross_ref_table';
  static const String mediaStaffCrossRefTable = 'media_staff_cross_ref_table';
  static const String staffTable = 'voice_actor_table';
  static const String userDataTable = 'user_data_table';
  static const String mediaListTable = 'media_list_table';
  static const String airingSchedulesTable = 'airing_schedules_table';
  static const String mediaExternalLickTable = 'media_external_link_table';
}

class AniflowDatabase {
  static AniflowDatabase? _instance;

  factory AniflowDatabase() => _instance ??= AniflowDatabase._();

  AniflowDatabase._();

  Database? _aniflowDB;

  MediaInformationDao? _mediaInformationDaoDao;

  UserDataDao? _userDataDao;

  MediaListDao? _mediaListDaoDao;

  Database get aniflowDB => _aniflowDB!;

  Future<void> initDatabase({String? dbName, bool isTest = false}) async {
    if (isTest) {
      _aniflowDB = await openDatabase(inMemoryDatabasePath);
    } else {
      final path = join(await getDatabasesPath(), dbName ?? databaseFileName);
      _aniflowDB = await openDatabase(path);
    }

    await _createTables();
  }

  MediaInformationDao getMediaInformationDaoDao() =>
      _mediaInformationDaoDao ??= MediaInformationDaoImpl(this);

  UserDataDao getUserDataDao() => _userDataDao ??= UserDataDaoImpl(this);

  MediaListDao getMediaListDao() => _mediaListDaoDao ??= MediaListDaoImpl(this);

  Future _createTables() async {
    await _aniflowDB!
        .execute('create table if not exists ${Tables.mediaTable} ('
            '${MediaTableColumns.id} text primary key,'
            '${MediaTableColumns.type} text,'
            '${MediaTableColumns.englishTitle} text,'
            '${MediaTableColumns.romajiTitle} text,'
            '${MediaTableColumns.nativeTitle} text,'
            '${MediaTableColumns.coverImage} text,'
            '${MediaTableColumns.coverImageColor} text,'
            '${MediaTableColumns.description} text,'
            '${MediaTableColumns.source} text,'
            '${MediaTableColumns.bannerImage} text,'
            '${MediaTableColumns.averageScore} integer,'
            '${MediaTableColumns.hashtag} text,'
            '${MediaTableColumns.trending} integer,'
            '${MediaTableColumns.favourites} integer,'
            '${MediaTableColumns.trailerId} text,'
            '${MediaTableColumns.trailerSite} text,'
            '${MediaTableColumns.trailerThumbnail} text,'
            '${MediaTableColumns.episodes} integer,'
            '${MediaTableColumns.seasonYear} integer,'
            '${MediaTableColumns.genres} text,'
            '${MediaTableColumns.season} text,'
            '${MediaTableColumns.status} text,'
            '${MediaTableColumns.timeUntilAiring} integer,'
            '${MediaTableColumns.nextAiringEpisode} integer,'
            '${MediaTableColumns.popularRanking} integer,'
            '${MediaTableColumns.ratedRanking} integer'
            ')');

    await _aniflowDB!
        .execute('create table if not exists ${Tables.categoryTable} ('
            '${CategoryColumns.category} text primary key'
            ')');

    await _aniflowDB!.execute(
        'create table if not exists ${Tables.animeCategoryCrossRefTable} ('
        '${MediaCategoryCrossRefColumns.mediaId} text,'
        '${MediaCategoryCrossRefColumns.categoryId} text,'
        '${MediaCategoryCrossRefColumns.timeStamp} integer,'
        'primary key (${MediaCategoryCrossRefColumns.mediaId}, ${MediaCategoryCrossRefColumns.categoryId}),'
        'foreign key (${MediaCategoryCrossRefColumns.mediaId}) references ${Tables.mediaTable} (${MediaTableColumns.id}),'
        'foreign key (${MediaCategoryCrossRefColumns.categoryId}) references ${Tables.categoryTable} (${CategoryColumns.category})'
        ')');

    await _aniflowDB!
        .execute('create table if not exists ${Tables.userDataTable} ('
            '${UserDataTableColumns.id} text primary key,'
            '${UserDataTableColumns.name} text,'
            '${UserDataTableColumns.avatarImage} text,'
            '${UserDataTableColumns.bannerImage} text)');

    await _aniflowDB!.execute(
        'create table if not exists ${Tables.characterTable} ('
        '${CharacterColumns.id} text primary key,'
        '${CharacterColumns.voiceActorId} text,'
        '${CharacterColumns.role} text,'
        '${CharacterColumns.image} text,'
        '${CharacterColumns.nameEnglish} text,'
        '${CharacterColumns.nameNative} text,'
        'foreign key (${CharacterColumns.voiceActorId}) references ${Tables.staffTable} (${StaffColumns.id})'
        ')');

    await _aniflowDB!
        .execute('create table if not exists ${Tables.staffTable} ('
            '${StaffColumns.id} text primary key,'
            '${StaffColumns.image} text,'
            '${StaffColumns.nameEnglish} text,'
            '${StaffColumns.nameNative} text)');

    await _aniflowDB!.execute(
        'create table if not exists ${Tables.mediaCharacterCrossRefTable} ('
        '${MediaCharacterCrossRefColumns.mediaId} text,'
        '${MediaCharacterCrossRefColumns.characterId} text,'
        '${MediaCharacterCrossRefColumns.timeStamp} integer,'
        'primary key (${MediaCharacterCrossRefColumns.mediaId}, ${MediaCharacterCrossRefColumns.characterId}),'
        'foreign key (${MediaCharacterCrossRefColumns.mediaId}) references ${Tables.mediaTable} (${MediaTableColumns.id}),'
        'foreign key (${MediaCharacterCrossRefColumns.characterId}) references ${Tables.characterTable} (${CharacterColumns.id})'
        ')');

    await _aniflowDB!.execute(
        'create table if not exists ${Tables.mediaStaffCrossRefTable} ('
        '${MediaStaffCrossRefColumns.mediaId} text,'
        '${MediaStaffCrossRefColumns.staffId} text,'
        '${MediaStaffCrossRefColumns.staffRole} text,'
        '${MediaStaffCrossRefColumns.timeStamp} integer,'
        'primary key (${MediaStaffCrossRefColumns.mediaId}, ${MediaStaffCrossRefColumns.staffRole}),'
        'foreign key (${MediaStaffCrossRefColumns.mediaId}) references ${Tables.mediaTable} (${MediaTableColumns.id}),'
        'foreign key (${MediaStaffCrossRefColumns.staffId}) references ${Tables.staffTable} (${StaffColumns.id})'
        ')');

    await _aniflowDB!.execute(
        'create table if not exists ${Tables.mediaListTable} ('
        '${MediaListTableColumns.id} text primary key,'
        '${MediaListTableColumns.userId} text,'
        '${MediaListTableColumns.mediaId} text,'
        '${MediaListTableColumns.status} text,'
        '${MediaListTableColumns.progress} integer,'
        '${MediaListTableColumns.score} integer,'
        '${MediaListTableColumns.updatedAt} integer,'
        'foreign key (${MediaListTableColumns.mediaId}) references ${Tables.mediaTable} (${MediaTableColumns.id})'
        'foreign key (${MediaListTableColumns.userId}) references ${Tables.userDataTable} (${UserDataTableColumns.id})'
        ')');

    await _aniflowDB!.execute(
        'create table if not exists ${Tables.airingSchedulesTable} ('
        '${AiringSchedulesColumns.id} text primary key,'
        '${AiringSchedulesColumns.mediaId} text,'
        '${AiringSchedulesColumns.airingAt} integer,'
        '${AiringSchedulesColumns.timeUntilAiring} integer,'
        '${AiringSchedulesColumns.episode} episode,'
        'foreign key (${AiringSchedulesColumns.mediaId}) references ${Tables.mediaTable} (${MediaTableColumns.id})'
        ')');

    await _aniflowDB!.execute(
        'CREATE TABLE IF NOT EXISTS ${Tables.mediaExternalLickTable} ('
        '${MediaExternalLinkColumnValues.id} text primary key,'
        '${MediaExternalLinkColumnValues.mediaId} text,'
        '${MediaExternalLinkColumnValues.url} text,'
        '${MediaExternalLinkColumnValues.site} text,'
        '${MediaExternalLinkColumnValues.type} text,'
        '${MediaExternalLinkColumnValues.siteId} integer,'
        '${MediaExternalLinkColumnValues.color} text,'
        '${MediaExternalLinkColumnValues.icon} text,'
        'foreign key (${MediaExternalLinkColumnValues.mediaId}) references ${Tables.mediaTable} (${MediaTableColumns.id})'
        ')');
  }
}
