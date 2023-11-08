// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
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
      await animeDatabase.initDatabase(path: inMemoryDatabasePath);

      repository = MediaListRepositoryImpl();
      isUnitTest = true;
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.delete(Tables.mediaTable);
      await animeDatabase.aniflowDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.aniflowDB.delete(Tables.categoryTable);
      await animeDatabase.aniflowDB.delete(Tables.userDataTable);
      await animeDatabase.aniflowDB.delete(Tables.mediaListTable);
    });

    test('get_user_anime_list_from_data_source', () async {
      final res = await repository.syncMediaList(userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));
    });

    test('ani_list_get_from_database', () async {
      final res = await repository.syncMediaList(userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));

      final res2 = await repository.getMediaListByPage(
          type: MediaType.anime,
          userId: '1',
          status: [MediaListStatus.current, MediaListStatus.planning],
          page: 1,
          perPage: 6);
      expect(res2.runtimeType, equals(LoadSuccess<List<MediaListItemModel>>));
    });

    test('ani_list_get_stream_test', () async {
      final res = await repository.syncMediaList(userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));

      final stream = repository.getMediaListStream(
          type: MediaType.anime,
          userId: '1',
          status: [MediaListStatus.current, MediaListStatus.planning]);
      final res2 = await stream.first;
      expect(res2.isNotEmpty, equals(true));
    });

    test('get_media_list_by_page', () async {
      final res = await repository.getMediaListByPage(
          userId: '6378393',
          status: [MediaListStatus.current],
          type: MediaType.anime,
          page: 1,
          perPage: 6);
      expect(res.runtimeType, equals(LoadSuccess<List<MediaListItemModel>>));
    });
  });
}
