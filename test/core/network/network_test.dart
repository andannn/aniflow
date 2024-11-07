import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/network/hianime_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late HiAnimationDataSource dataSource;

    late Dio dio;
    setUp(() async {
      dio = Dio()
        ..options = BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        )
        ..interceptors.addAll([
          LogInterceptor(),
        ]);
      dataSource = HiAnimationDataSource(dio: dio);
    });

    test('getPlayLink', () async {
      final source = await dataSource.getPlayLink("128750");
      logger.d(source);
    });
  });
}
