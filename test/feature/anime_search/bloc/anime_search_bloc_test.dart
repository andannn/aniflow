import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_search_bloc_test', () {
    late SearchPageBloc searchPageBloc;
    final animeDatabase = AniflowDatabase();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();

      await animeDatabase.initDatabase(isTest: true);
      searchPageBloc = SearchPageBloc(
          searchRepository: SearchRepositoryImpl(),
          userDataRepository: UserDataRepositoryImpl());
    });

    test('test_search_bloc', () async {
      searchPageBloc.add(OnSearchStringCommit(searchString: 'Titan'));

      await Future.delayed(const Duration(seconds: 3));

      expect(searchPageBloc.state.data.isNotEmpty, equals(true));
    });
  });
}
