import 'dart:async';

import 'package:anime_tracker/core/database/user_anime_list_dao.dart';
import 'package:anime_tracker/core/database/user_data_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';

const databaseFileName = "anime_data_base.db";

mixin Tables {
  static const String animeTable = 'anime_table';
  static const String categoryTable = 'category_table';
  static const String animeCategoryCrossRefTable = 'anime_category_cross_ref_table';
  static const String characterTable = 'character_table';
  static const String animeCharacterCrossRefTable = 'anime_character_cross_ref_table';
  static const String voiceActorTable = 'voice_actor_table';
  static const String userDataTable = 'user_data_table';
  static const String userAnimeListTable = 'usr_anime_list_table';
}

class AnimeDatabase {
  static AnimeDatabase? _instance;

  factory AnimeDatabase() => _instance ??= AnimeDatabase._();

  AnimeDatabase._();

  Database? _animeDB;

  AnimeListDao? _animeDao;

  UserDataDao? _userDataDao;

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

  Future _createTables() async {
    await _animeDB!.execute('create table if not exists ${Tables.animeTable} ('
        '${AnimeTableColumns.id} text primary key, '
        '${AnimeTableColumns.englishTitle} text, '
        '${AnimeTableColumns.romajiTitle} text, '
        '${AnimeTableColumns.nativeTitle} text, '
        '${AnimeTableColumns.coverImage} text, '
        '${AnimeTableColumns.coverImageColor} text, '
        '${AnimeTableColumns.description} text, '
        '${AnimeTableColumns.source} text, '
        '${AnimeTableColumns.bannerImage} text, '
        '${AnimeTableColumns.averageScore} integer, '
        '${AnimeTableColumns.trending} integer, '
        '${AnimeTableColumns.favourites} integer, '
        '${AnimeTableColumns.trailerId} text, '
        '${AnimeTableColumns.trailerSite} text, '
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
        '${AnimeCategoryCrossRefColumns.animeId} text, '
        '${AnimeCategoryCrossRefColumns.categoryId} text, '
        'primary key (${AnimeCategoryCrossRefColumns.animeId}, ${AnimeCategoryCrossRefColumns.categoryId}), '
        'foreign key (${AnimeCategoryCrossRefColumns.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id}), '
        'foreign key (${AnimeCategoryCrossRefColumns.categoryId}) references ${Tables.categoryTable} (${CategoryColumns.category})'
        ')');

    await _animeDB!
        .execute('CREATE TABLE IF NOT EXISTS ${Tables.userDataTable} ('
            '${UserDataTableColumns.id} text primary key, '
            '${UserDataTableColumns.name} text, '
            '${UserDataTableColumns.avatarImage} text, '
            '${UserDataTableColumns.bannerImage} text)');

    await _animeDB!
        .execute('CREATE TABLE IF NOT EXISTS ${Tables.characterTable} ('
            '${CharacterColumns.id} text primary key, '
            '${CharacterColumns.voiceActorId} text, '
            '${CharacterColumns.role} text, '
            '${CharacterColumns.image} text, '
            '${CharacterColumns.nameEnglish} text, '
            '${CharacterColumns.nameNative} text)');

    await _animeDB!
        .execute('CREATE TABLE IF NOT EXISTS ${Tables.voiceActorTable} ('
            '${VoiceActorColumns.id} text primary key, '
            '${VoiceActorColumns.image} text, '
            '${VoiceActorColumns.nameEnglish} text, '
            '${VoiceActorColumns.nameNative} text)');

    await _animeDB!.execute(
        'create table if not exists ${Tables.animeCharacterCrossRefTable} ('
        '${AnimeCharacterCrossRefColumns.animeId} text, '
        '${AnimeCharacterCrossRefColumns.characterId} text, '
        'primary key (${AnimeCharacterCrossRefColumns.animeId}, ${AnimeCharacterCrossRefColumns.characterId}), '
        'foreign key (${AnimeCharacterCrossRefColumns.animeId}) references ${Tables.animeTable} (${AnimeTableColumns.id}), '
        'foreign key (${AnimeCharacterCrossRefColumns.characterId}) references ${Tables.characterTable} (${CharacterColumns.id})'
        ')');

    await _animeDB!
        .execute('CREATE TABLE IF NOT EXISTS ${Tables.userAnimeListTable} ('
        '${UserAnimeListTableColumns.id} text primary key,'
        '${UserAnimeListTableColumns.userId} text,'
        '${UserAnimeListTableColumns.animeId} text,'
        '${UserAnimeListTableColumns.status} text,'
        '${UserAnimeListTableColumns.score} integer,'
        '${UserAnimeListTableColumns.updatedAt} integer)');
  }
}
