import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/network/playable_web_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('playable source repository test', () {
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

    test('parse season', () async {
      expect(parseSeasonNumFromTitle("Unnamed Memory Act.2"), 2);
      expect(parseSeasonNumFromTitle("Re:ゼロから始める異世界生活 3rd season"), 3);
      expect(parseSeasonNumFromTitle("シャングリラ・フロンティア 2nd season"), 2);
      expect(parseSeasonNumFromTitle("異修羅 第2期"), 2);
      expect(parseSeasonNumFromTitle("俺だけレベルアップな件 Season 2 -Arise from the Shadow-"), 2);
      expect(parseSeasonNumFromTitle("君のことが大大大大大好きな100人の彼女 第2期"), 2);
      expect(parseSeasonNumFromTitle("僕のヒーローアカデミア２"), 2);
      expect(parseSeasonNumFromTitle("Dr.STONE NEW WORLD 第2クール"), 2);
      expect(parseSeasonNumFromTitle("モブサイコ100 Ⅲ"), 3);
    });

    // test("test fetch episode", () async {
    //   final result = await repository.searchPlaySource(MediaSource.vdm10, "1", "Unnamed Memory Act.2", Locale('JP'), 1);
    //   switch (result) {
    //     case LoadError<List<EpisodeModel>>():
    //       print(result.exception);
    //     case LoadSuccess<List<EpisodeModel>>():
    //       print(result.data);
    //   }
    // });
  });
}
