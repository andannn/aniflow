// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/shared_preference/aniflow_prefrences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AniflowDatabase();
    late MediaListRepository repository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      await AniFlowPreferences().init();
      await AniFlowPreferences().setCurrentSeasonYear(2023);
      await AniFlowPreferences().setCurrentSeason(AnimeSeason.summer);
      await animeDatabase.initDatabase(isTest: true);

      repository = MediaListRepositoryImpl();
      isUnitTest = true;
      AuthDataSource().setTestToken(
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImFmNjI3ODk4NzQ1YzBhZWIwOGZmYmYyNjA4MTQ4NzgyYWNhMDM0YmM1NWMzZWZlYzE3OTZlNGI0NjgyMGFiNjdhNzljZTA2MTRhNDZlNTVmIn0.eyJhdWQiOiIxNDQwOSIsImp0aSI6ImFmNjI3ODk4NzQ1YzBhZWIwOGZmYmYyNjA4MTQ4NzgyYWNhMDM0YmM1NWMzZWZlYzE3OTZlNGI0NjgyMGFiNjdhNzljZTA2MTRhNDZlNTVmIiwiaWF0IjoxNjk1NjUxMjA1LCJuYmYiOjE2OTU2NTEyMDUsImV4cCI6MTcyNzI3MzYwNSwic3ViIjoiNjM3ODM5MyIsInNjb3BlcyI6W119.XGdU2Zg6tlPoKxKi6VxqqvfPSqmuwj_PW3zKagYyk9j_NIbzkrCFOh9MNLF0X1ifRmB9LcfD5mj4_mj7f63ufwJW7VLrtAaUUu3Vbg8cOwUiPibgnQfVmErv_mThDphLvw4LCEmX7ok13QqC9XMk2AVLNvx9TZW5fo6SfXS4rPySgvHhzMyPc6gbYWkvUTYCBYYTYbWPR7ZcL6gCR1NYPv4NnkVfxFDYF6KKt3nCjcZ7XY894K4GKRIlINoR2KNjflfLzVW2PcopmfQRveXRTKZBmaPeZa5HFbHclpRVe0kxoildpg_4uqqWPjPbUDkuMK3gIHahs2WjqiLc8Le0O9pMRyvaETp27iJVUcoeNFy05vLS6ZzSyoI6tFqfveTiQsrPKLodFjMAVoroTQoIZuX60r9ri-8oj1yWF3Wms4OIHQItkSyJKwezAizrIntRS8kiguuejdS_qWfNTFmMjYOxKU_-d9rcHDjYcVHxr7FPkp7HfpqN1CPVYNn8BMLtRYECMTs-Ds-kY9DDHlLQAWggOtYOR4KsU0sRqOpC4yqmkEdCCZLbdpZOwbCpp-ZLWu1jCICNGI8QEEHfrnvnBHR4KbqguMyOPIVviNXTx82DWNfI_KZTGb5PHuYMleBXacYO9wg0KTYKggVtn6ULxR0ekoA_77otU6x_bf4fW2Q');
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.delete(Tables.mediaTable);
      await animeDatabase.aniflowDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.aniflowDB.delete(Tables.categoryTable);
      await animeDatabase.aniflowDB.delete(Tables.userDataTable);
      await animeDatabase.aniflowDB.delete(Tables.mediaListTable);
    });

    test('get_user_anime_list_from_data_source', () async {
      final res = await repository.syncUserAnimeList(
          userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));
    });

    test('ani_list_get_from_database', () async {
      final res = await repository.syncUserAnimeList(
          userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));

      final res2 = await repository.getUserAnimeList(
        type: MediaType.anime,
          userId: 1,
          status: [MediaListStatus.current, MediaListStatus.planning]);
      expect(res2.isNotEmpty, equals(true));
    });

    test('ani_list_get_stream_test', () async {
      final res = await repository.syncUserAnimeList(
          userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));

      final stream = repository.getUserAnimeListStream(
          type: MediaType.anime,

          userId: '1',
          status: [MediaListStatus.current, MediaListStatus.planning]);
      final res2 = await stream.first;
      expect(res2.isNotEmpty, equals(true));
    });

    test('save_anime_to_anime_track_list', () async {
      // await repository.updateAnimeInTrackList(animeId: 30);
    });
  });
}
