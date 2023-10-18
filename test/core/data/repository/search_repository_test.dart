import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', () {

    late SearchRepository searchRepository;
    setUp(() async {
      searchRepository = SearchRepositoryImpl();
    });
    test('search page', () async {
      final res = await searchRepository
          .loadMediaSearchResultByPage(page: 1, perPage: 3, search:  'Titan');
      expect(res.runtimeType, LoadSuccess<List<AnimeModel>>);
    });
  });
}
