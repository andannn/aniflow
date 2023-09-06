import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/load_type.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AnimeDatabase();
    late AniListRepository aniListRepository;

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(isTest: true);

      aniListRepository = aniListRepo;
    });

    test('ani_list_initial_get', () async {
      final animeDao = animeDatabase.getAnimeDao();

      final result = await aniListRepository.loadAnimePage(type: LoadType.append, page: 1);
      final dbResult = await animeDao.getCurrentSeasonAnimeByPage(page: 1);
      expect((result as LoadSuccess).data, equals(dbResult));
    });

    test('ani_list_repeat_get', () async {
      final animeDao = animeDatabase.getAnimeDao();

      await aniListRepository.loadAnimePage(type: LoadType.append, page: 1);

      await aniListRepository.loadAnimePage(type: LoadType.append, page: 2);

      await aniListRepository.loadAnimePage(type: LoadType.append, page: 3);

      final result_again_1 = await aniListRepository.loadAnimePage(type: LoadType.append, page: 1);

      final dbResult = await animeDao.getCurrentSeasonAnimeByPage(page: 1);
      expect((result_again_1 as LoadSuccess).data, equals(dbResult));
    });

    test('ani_list_repeat_get_and_refresh', () async {
      final animeDao = animeDatabase.getAnimeDao();

      await aniListRepository.loadAnimePage(type: LoadType.append, page: 1);

      await aniListRepository.loadAnimePage(type: LoadType.append, page: 2);

      final result_refresh_1 = await aniListRepository.loadAnimePage(type: LoadType.refresh);

      final dbResult = await animeDao.getCurrentSeasonAnimeByPage(page: 1);
      expect((result_refresh_1 as LoadSuccess).data,
          equals(dbResult.map((e) => ShortcutAnimeModel.fromDatabaseModel(e)).toList()));
    });
  });
}
