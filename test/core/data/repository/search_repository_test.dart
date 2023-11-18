import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('short_network_anime_model_from_json', () {
    late SearchRepository searchRepository;
    final animeDatabase = AniflowDatabase();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      SharedPreferences.setMockInitialValues({});
      await animeDatabase.initDatabase(path: inMemoryDatabasePath);
      await AniFlowPreferences().init();

      searchRepository = SearchRepositoryImpl();
    });

    test('search page', () async {
      final res = await searchRepository.loadMediaSearchResultByPage(
          page: 1, perPage: 3, search: 'Titan', type: MediaType.anime);
      expect(res.runtimeType, LoadSuccess<List<MediaModel>>);
    });
  });
}
