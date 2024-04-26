import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFavoriteRepository extends Fake implements FavoriteRepository {
  @override
  Future<LoadResult> toggleFavoriteCharacter(
      String id, CancelToken token) async {
    return LoadSuccess(data: null);
  }
}
