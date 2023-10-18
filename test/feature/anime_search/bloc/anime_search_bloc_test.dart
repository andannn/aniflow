import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:anime_tracker/feature/anime_search/bloc/anime_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_search_bloc_test', () {
    late SearchPageBloc searchPageBloc;

    setUp(() async {
      searchPageBloc = SearchPageBloc(searchRepository: SearchRepositoryImpl());
    });

    test('test_search_bloc', () async {
      searchPageBloc.add(OnSearchStringCommit(searchString: 'Titan'));

      await Future.delayed(const Duration(seconds: 3));

      expect(searchPageBloc.state.data.isNotEmpty, equals(true));
    });
  });
}
