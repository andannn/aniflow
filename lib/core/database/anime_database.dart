// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/anime_track_list_dao.dart';
import 'package:anime_tracker/core/database/user_data_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const databaseFileName = "anime_data_base.db";

mixin Tables {
  static const String animeTable = 'anime_table';
  static const String categoryTable = 'category_table';
  static const String animeCategoryCrossRefTable =
      'anime_category_cross_ref_table';
  static const String characterTable = 'character_table';
  static const String animeCharacterCrossRefTable =
      'anime_character_cross_ref_table';
  static const String animeStaffCrossRefTable = 'anime_staff_cross_ref_table';
  static const String staffTable = 'voice_actor_table';
  static const String userDataTable = 'user_data_table';
  static const String animeTrackListTable = 'usr_anime_list_table';
  static const String airingSchedulesTable = 'airing_schedules_table';
  static const String mediaExternalLickTable = 'media_external_link_table';
}

class AnimeDatabase {
  static AnimeDatabase? _instance;

  factory AnimeDatabase() => _instance ??= AnimeDatabase._();

  AnimeDatabase._();

  Database? _animeDB;

  AnimeListDao? _animeDao;

  UserDataDao? _userDataDao;

  AnimeTrackListDao? _userAnimeListDao;

  Database get animeDB => _animeDB!;

  Future<void> initDatabase({String? dbName, bool isTest = false}) async {
    if (isTest) {
      _animeDB = await openDatabase(inMemoryDatabasePath);
    } else {
      final path = join(await getDatabasesPath(), dbName ?? databaseFileName);
      _animeDB = await openDatabase(path);
    }

    await _createTables();
  }

  AnimeListDao getAnimeDao() => _animeDao ??= AnimeDaoImpl(this);

  UserDataDao getUserDataDao() => _userDataDao ??= UserDataDaoImpl(this);

  AnimeTrackListDao getAnimeTrackListDao() =>
      _userAnimeListDao ??= UserAnimeListDaoImpl(this);

  Future _createTables() async {
    await _animeDB!.execute('create table if not exists ${Tables.animeTable} ('
        '${AnimeTableColumns.id} text primary key,'
        '${AnimeTableColumns.englishTitle} text,'
        '${AnimeTableColumns.romajiTitle} text,'
        '${AnimeTableColumns.nativeTitle} text,'
        '${AnimeTableColumns.coverImage} text,'
        '${AnimeTableColumns.coverImageColor} text,'
        '${AnimeTableColumns.description} text,'
        '${AnimeTableColumns.source} text,'
        '${AnimeTableColumns.bannerImage} text,'
        '${AnimeTableColumns.averageScore} integer,'
        '${AnimeTableColumns.hashtag} text,'
        '${AnimeTableColumns.trending} integer,'
        '${AnimeTableColumns.favourites} integer,'
        '${AnimeTableColumns.trailerId} text,'
        '${AnimeTableColumns.trailerSite} text,'
        '${AnimeTableColumns.trailerThumbnail} text,'
        '${AnimeTableColumns.episodes} integer,'
        '${AnimeTableColumns.seasonYear} integer,'
        '${AnimeTableColumns.genres} text,'
        '${AnimeTableColumns.season} text,'
        '${AnimeTableColumns.status} text,'
        '${AnimeTableColumns.timeUntilAiring} integer,'
        '${AnimeTableColumns.nextAiringEpisode} integer,'
        '${AnimeTableColumns.popularRanking} integer,'
        '${AnimeTableColumns.ratedRanking} integer'
        ')');

    await _animeDB!
        .execute('create table if not exists ${Tables.categoryTable} ('
            '${CategoryColumns.category} text primary key'
            ')');

    await _animeDB!.execute(
        'create table if not exists ${Tables.animeCategoryCrossRefTable} ('
        '${AnimeCategoryCrossRefColumns.animeId} text,'
        '${AnimeCategoryCrossRefColumns.categoryId} text,'
        '${AnimeCategoryCrossRefColumns.timeStamp} integer,'
        'primary key (${AnimeCategoryCrossRefColumns.animeId}, ${AnimeCategoryCrossRefColumns.categoryId}),'
        'foreign key (${AnimeCategoryCrossRefColumns.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id}),'
        'foreign key (${AnimeCategoryCrossRefColumns.categoryId}) references ${Tables.categoryTable} (${CategoryColumns.category})'
        ')');

    await _animeDB!
        .execute('create table if not exists ${Tables.userDataTable} ('
            '${UserDataTableColumns.id} text primary key,'
            '${UserDataTableColumns.name} text,'
            '${UserDataTableColumns.avatarImage} text,'
            '${UserDataTableColumns.bannerImage} text)');

    await _animeDB!.execute(
        'create table if not exists ${Tables.characterTable} ('
        '${CharacterColumns.id} text primary key,'
        '${CharacterColumns.voiceActorId} text,'
        '${CharacterColumns.role} text,'
        '${CharacterColumns.image} text,'
        '${CharacterColumns.nameEnglish} text,'
        '${CharacterColumns.nameNative} text,'
        'foreign key (${CharacterColumns.voiceActorId}) references ${Tables.staffTable} (${StaffColumns.id})'
        ')');

    await _animeDB!.execute('create table if not exists ${Tables.staffTable} ('
        '${StaffColumns.id} text primary key,'
        '${StaffColumns.image} text,'
        '${StaffColumns.nameEnglish} text,'
        '${StaffColumns.nameNative} text)');

    await _animeDB!.execute(
        'create table if not exists ${Tables.animeCharacterCrossRefTable} ('
        '${AnimeCharacterCrossRefColumns.animeId} text,'
        '${AnimeCharacterCrossRefColumns.characterId} text,'
        '${AnimeCharacterCrossRefColumns.timeStamp} integer,'
        'primary key (${AnimeCharacterCrossRefColumns.animeId}, ${AnimeCharacterCrossRefColumns.characterId}),'
        'foreign key (${AnimeCharacterCrossRefColumns.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id}),'
        'foreign key (${AnimeCharacterCrossRefColumns.characterId}) references ${Tables.characterTable} (${CharacterColumns.id})'
        ')');

    await _animeDB!.execute(
        'create table if not exists ${Tables.animeStaffCrossRefTable} ('
        '${AnimeStaffCrossRefColumns.animeId} text,'
        '${AnimeStaffCrossRefColumns.staffId} text,'
        '${AnimeStaffCrossRefColumns.staffRole} text,'
        '${AnimeStaffCrossRefColumns.timeStamp} integer,'
        'primary key (${AnimeStaffCrossRefColumns.animeId}, ${AnimeStaffCrossRefColumns.staffRole}),'
        'foreign key (${AnimeStaffCrossRefColumns.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id}),'
        'foreign key (${AnimeStaffCrossRefColumns.staffId}) references ${Tables.staffTable} (${StaffColumns.id})'
        ')');

    await _animeDB!.execute(
        'create table if not exists ${Tables.animeTrackListTable} ('
        '${AnimeTrackItemTableColumns.id} text primary key,'
        '${AnimeTrackItemTableColumns.userId} text,'
        '${AnimeTrackItemTableColumns.animeId} text,'
        '${AnimeTrackItemTableColumns.status} text,'
        '${AnimeTrackItemTableColumns.progress} integer,'
        '${AnimeTrackItemTableColumns.score} integer,'
        '${AnimeTrackItemTableColumns.updatedAt} integer,'
        'foreign key (${AnimeTrackItemTableColumns.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id})'
        'foreign key (${AnimeTrackItemTableColumns.userId}) references ${Tables.userDataTable} (${UserDataTableColumns.id})'
        ')');

    await _animeDB!.execute(
        'create table if not exists ${Tables.airingSchedulesTable} ('
        '${AiringSchedulesColumns.id} text primary key,'
        '${AiringSchedulesColumns.mediaId} text,'
        '${AiringSchedulesColumns.airingAt} integer,'
        '${AiringSchedulesColumns.timeUntilAiring} integer,'
        '${AiringSchedulesColumns.episode} episode,'
        'foreign key (${AiringSchedulesColumns.mediaId}) references ${Tables.animeTable} (${AnimeTableColumns.id})'
        ')');

    await _animeDB!.execute(
        'CREATE TABLE IF NOT EXISTS ${Tables.mediaExternalLickTable} ('
        '${MediaExternalLinkColumnValues.id} text primary key,'
        '${MediaExternalLinkColumnValues.animeId} text,'
        '${MediaExternalLinkColumnValues.url} text,'
        '${MediaExternalLinkColumnValues.site} text,'
        '${MediaExternalLinkColumnValues.type} text,'
        '${MediaExternalLinkColumnValues.siteId} integer,'
        '${MediaExternalLinkColumnValues.color} text,'
        '${MediaExternalLinkColumnValues.icon} text,'
        'foreign key (${MediaExternalLinkColumnValues.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id})'
        ')');
  }
}
