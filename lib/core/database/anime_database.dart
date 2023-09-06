import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'anime_dao.dart';

const databaseFileName = "anime_data_base.db";

mixin Tables {
  static const String animeTable = 'anime_table';
}

class AnimeDatabase {
  static AnimeDatabase? _instance;

  factory AnimeDatabase() => _instance ??= AnimeDatabase._();

  AnimeDatabase._();

  Database? _animeDB;

  AnimeDao? _animeDao;

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

  AnimeDao getAnimeDao() {
    if (_animeDB == null) {
      throw "";
    }

    return _animeDao ??= AnimeDaoImpl(this);
  }

  Future _createTables() async {
    await _animeDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.animeTable} ('
        '${AnimeTableColumns.id} TEXT PRIMARY KEY, '
        '${AnimeTableColumns.englishTitle} TEXT, '
        '${AnimeTableColumns.romajiTitle} TEXT, '
        '${AnimeTableColumns.nativeTitle} TEXT, '
        '${AnimeTableColumns.coverImage} TEXT, '
        '${AnimeTableColumns.coverImageColor} TEXT)');
  }
}
