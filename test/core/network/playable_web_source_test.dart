import 'dart:ui';

import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/network/playable_web_source.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late PlayableWebSource dataSource;

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
      dataSource = PlayableWebSource(dio);
    });

    test('test_search_subject', () async {
      for (final title in [
        "Re:ゼロから始める異世界生活",
        "Re：从零开始的异世界生活",
        "Re:ZERO -Starting Life in Another World-"
      ]) {
        for (final config in [MediaSource.qdm8.toConfig()]) {
          final res1 = await dio.searchSubject(config: config, title: title);
          print("config: ${config.baseUrl} / title: $title \n result $res1");
        }
      }
    });

    test('test search episode', () async {
      final templateUrl = [
        "https://www.qdm8.com/dongman/6240.html"
      ];
      await Future.wait(
          [MediaSource.qdm8.toConfig()].mapIndexed((index, config) async {
        final res1 =
            await dio.getEpisodes(config: config, url: templateUrl[index]);
        print("config: ${config.baseUrl} \n result $res1");
      }));
    });

    test('convert keyword', () async {
      final res = await dio.convertKeyword(Locale("zh"), "シャングリラ・フロンティア 2nd season");
      print(res);
    });
  });
}
