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
      await animeDatabase.initDatabase(isTest: true);

      repository = MediaListRepositoryImpl();
      isUnitTest = true;
      testToken =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc4ZWQ1YTk5ZDFkNTU2NDBkMTRkN2E5N2I1YWMyNDc3MjIyODFhYjM2NzE4MmFiN2VjNDg2ZTJjOWQ0MTA2MDZkN2ZlOGZkYzA1YjJlOGQ2In0.eyJhdWQiOiIxNDQwOSIsImp0aSI6Ijc4ZWQ1YTk5ZDFkNTU2NDBkMTRkN2E5N2I1YWMyNDc3MjIyODFhYjM2NzE4MmFiN2VjNDg2ZTJjOWQ0MTA2MDZkN2ZlOGZkYzA1YjJlOGQ2IiwiaWF0IjoxNjk4NTY2MzU0LCJuYmYiOjE2OTg1NjYzNTQsImV4cCI6MTczMDE4ODc1NCwic3ViIjoiNjM3ODM5MyIsInNjb3BlcyI6W119.cjnTU0bSGzQnjxbAy-wkzRqiI5r2zAI_XmOX8teX0MZuceDj7qiBQQ6An-p6Ue30LYSI7V5Tw4ocChZn1bRsg6sRFCPAmE8eBbV4XBGjOhlAb9ciqMgTmVeND6bz0uWO1lr3D0fLfmQKPchrZAwb1-aVDhMkI3Ba4bC1VzxfbGPpw3IzbXjbAg1kFStENCvn3fTXTX53ndNGuPlbS6l8tfOlgYSK7dm0le4JrJAEIlm_Om4WYb6ij42sI0WK1pJY5Lzpar-K0KxaubN9poNKXa81PX65DABzywHXrEi8_D7_O_DkIVsKPjU5dAhXUEhmukFkkLDbRgn7np0i8A-wAfTrVq3tLPvUkDoqdyH105mmwXR_nwO3ZqKJtCnolUok289my02qP1yA0uSmq0nJ51ikI3CEnk_H-jCz5OcVAUhN2qNRb3fhx0fNekBBfaUuJqbHr7usgaNAWRu_vQX0LGs7daClKl1k5FBtdrsJGwSkbY13ghKH42pmBVlY-I9oS8ocznuMsVtyo7QfY6oaMv9kZBuelMto7pM28z61S__qo2jsKzr_2I5uAH3avjUY28G8M3r0r3nkkXqMu_BPn3T95LOLTCghtwx2cE4LARBpZ_1t9rYFUzDb05HeARrqWzbhOwbm9c0N5RM8guq6O1q8kAVZFNLTLjK25ycBuiw';
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
