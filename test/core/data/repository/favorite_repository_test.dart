import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('favorite_repository_test', () {
    final animeDatabase = AniflowDatabase();
    FavoriteRepository favoriteRepository = FavoriteRepositoryImpl();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      SharedPreferences.setMockInitialValues({});
      await animeDatabase.initDatabase(isTest: true);
    });

    test('favorite_anime_test', () async {
      final result = await favoriteRepository.loadFavoriteMediaByPage(
          type: MediaType.anime, userId: '6378393', loadType: const Refresh());
      expect(result.runtimeType, LoadSuccess<List<MediaModel>>);
    });
  });
}
