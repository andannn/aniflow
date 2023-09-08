import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'anime_dao.dart';

const databaseFileName = "anime_data_base.db";

mixin Tables {
  static const String currentSeasonAnimeTable = 'current_season_anime_table';
  static const String nextSeasonAnimeTable = 'next_season_anime_table';
  static const String trendingSeasonAnimeTable = 'trending_season_anime_table';
}

class AnimeDatabase {
  static AnimeDatabase? _instance;

  factory AnimeDatabase() => _instance ??= AnimeDatabase._();

  AnimeDatabase._();

  Database? _animeDB;

  AnimeListDao? _animeDao;

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

  AnimeListDao getAnimeDao() {
    if (_animeDB == null) {
      throw "";
    }

    return _animeDao ??= AnimeDaoImpl(this);
  }

  Future _createTables() async {
    await _animeDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.currentSeasonAnimeTable} ('
        '${AnimeTableColumns.id} TEXT PRIMARY KEY, '
        '${AnimeTableColumns.englishTitle} TEXT, '
        '${AnimeTableColumns.romajiTitle} TEXT, '
        '${AnimeTableColumns.nativeTitle} TEXT, '
        '${AnimeTableColumns.coverImage} TEXT, '
        '${AnimeTableColumns.coverImageColor} TEXT)');
    await _animeDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.nextSeasonAnimeTable} ('
        '${AnimeTableColumns.id} TEXT PRIMARY KEY, '
        '${AnimeTableColumns.englishTitle} TEXT, '
        '${AnimeTableColumns.romajiTitle} TEXT, '
        '${AnimeTableColumns.nativeTitle} TEXT, '
        '${AnimeTableColumns.coverImage} TEXT, '
        '${AnimeTableColumns.coverImageColor} TEXT)');
    await _animeDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.trendingSeasonAnimeTable} ('
        '${AnimeTableColumns.id} TEXT PRIMARY KEY, '
        '${AnimeTableColumns.englishTitle} TEXT, '
        '${AnimeTableColumns.romajiTitle} TEXT, '
        '${AnimeTableColumns.nativeTitle} TEXT, '
        '${AnimeTableColumns.coverImage} TEXT, '
        '${AnimeTableColumns.coverImageColor} TEXT)');
  }
}
