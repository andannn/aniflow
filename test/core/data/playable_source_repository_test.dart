import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('playable source repository test', () {
    // late PlayableWebSource dataSource;

    // late Dio dio;
    // setUp(() async {
    //   dio = Dio()
    //     ..options = BaseOptions(
    //       connectTimeout: const Duration(seconds: 15),
    //       receiveTimeout: const Duration(seconds: 15),
    //       headers: {
    //         "Content-Type": "application/json",
    //         "Accept": "application/json",
    //       },
    //     )
    //     ..interceptors.addAll([
    //       LogInterceptor(),
    //     ]);
    // });

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
      expect(parseSeasonNumFromTitle("わたしの幸せな結婚 第二期"), 2);
    });

    test("test fetch episode", () async {
      // final a = document.querySelectorAll("#playlist1 > ul > li > a");
      // final a =  await dio.getEpisodes(config: SearchConfig(baseUrl: "https://www.dmdan8.com", searchUrl: "https://www.dmdan8.com/search/-------------.html?wd={keyword}", matcher: Dmdan8Macher()), url: 'https://www.dmdan8.com/video/9142.html');
      // print(a);
    });
  });
}
