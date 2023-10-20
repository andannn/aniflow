import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', () {
    final dummyData = {
      "id": 124,
      "coverImage": {
        "extraLarge":
        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/124.jpg",
        "large":
        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/124.jpg",
        "medium":
        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/124.jpg",
        "color": "#e4785d"
      },
      "title": {
        "romaji": "Fushigi Yuugi: Eikoden",
        "english": "Mysterious Play: Eikoden",
        "native": "ふしぎ遊戯 -永光伝"
      }
    };
    test('get_topics', () async {
      final res = MediaDto.fromJson(dummyData);
      expect(res, equals(
          MediaDto(
              id: 124,
              title: MediaTitle(
                  romaji: "Fushigi Yuugi: Eikoden",
                  english: "Mysterious Play: Eikoden",
                  native: "ふしぎ遊戯 -永光伝"
              ),
              coverImage: {
                "extraLarge":
                "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/124.jpg",
                "large":
                "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/124.jpg",
                "medium":
                "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/124.jpg",
                "color": "#e4785d"
              }
          )
      ));
    });
  });
}
