import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSearchRepository extends Fake implements SearchRepository {
  @override
  Future<LoadResult<List<MediaModel>>> loadMediaSearchResultByPage({
    required int page,
    required int perPage,
    required String search,
    required MediaType type,
    CancelToken? token,
  }) async {
    return LoadSuccess(data: const []);
  }
}
