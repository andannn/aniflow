import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: HiAnimationRepository)
class MockHiAnimationRepository implements HiAnimationRepository {
  @override
  Future<LoadResult<Episode>> searchPlaySourceByKeyword(
      String animeId, List<String> keywords, String episode,
      [CancelToken? cancelToken]) {
    return Future.value(LoadError(Exception('not implemented')));
  }
}
