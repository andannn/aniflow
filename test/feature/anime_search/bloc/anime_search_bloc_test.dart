import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/feature/anime_search/bloc/anime_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_search_bloc_test', () {
    late SearchPageBloc searchPageBloc;
    final animeDatabase = AnimeDatabase();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(isTest: true);
      searchPageBloc = SearchPageBloc(searchRepository: SearchRepositoryImpl());
    });

    test('test_search_bloc', () async {
      searchPageBloc.add(OnSearchStringCommit(searchString: 'Titan'));

      await Future.delayed(const Duration(seconds: 3));

      expect(searchPageBloc.state.data.isNotEmpty, equals(true));
    });
  });
}
