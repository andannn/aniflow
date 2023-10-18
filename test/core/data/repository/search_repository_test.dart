import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('short_network_anime_model_from_json', () {
    late SearchRepository searchRepository;
    final animeDatabase = AnimeDatabase();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      await animeDatabase.initDatabase(isTest: true);

      searchRepository = SearchRepositoryImpl();
    });

    test('search page', () async {
      final res = await searchRepository.loadMediaSearchResultByPage(
          page: 1, perPage: 3, search: 'Titan');
      expect(res.runtimeType, LoadSuccess<List<AnimeModel>>);
    });
  });
}
