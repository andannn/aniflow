import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('detail_network_anime_model_from_json', () {
    final dummyData = {
      "id": 1,
      "title": {
        "romaji": "Cowboy Bebop",
        "english": "Cowboy Bebop",
        "native": "カウボーイビバップ"
      },
      "description": "Enter a world in the distant future, where Bounty Hunters roam the solar system. Spike and Jet, bounty hunting partners, set out on journeys in an ever struggling effort to win bounty rewards to survive.<br><br>\nWhile traveling, they meet up with other very interesting people. Could Faye, the beautiful and ridiculously poor gambler, Edward, the computer genius, and Ein, the engineered dog be a good addition to the group?",
      "episodes": 26,
      "source": "ORIGINAL",
      "trailer": {
        "id": "OhNwckCLzis",
        "site": "youtube",
        "thumbnail": "https://i.ytimg.com/vi/OhNwckCLzis/hqdefault.jpg"
      },
      "coverImage": {
        "extraLarge": "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png",
        "large": "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx1-CXtrrkMpJ8Zq.png",
        "medium": "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1-CXtrrkMpJ8Zq.png",
        "color": "#f1785d"
      },
      "bannerImage": "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1-OquNCNB6srGe.jpg",
      "averageScore": 86,
      "favourites": 21495,
      "trending": 5,
      "isFavourite": false,
      "nextAiringEpisode": null,
      "characters": {
        "pageInfo": {
          "total": 500,
          "perPage": 5,
          "currentPage": 5,
          "lastPage": 100,
          "hasNextPage": true
        },
        "edges": [
          {
            "role": "SUPPORTING",
            "node": {
              "id": 83271,
              "image": {
                "large": "https://s4.anilist.co/file/anilistcdn/character/large/83271.jpg"
              },
              "name": {
                "full": "MPU",
                "native": "んぴゅー"
              }
            },
            "voiceActors": [
              {
                "id": 95091,
                "image": {
                  "large": "https://s4.anilist.co/file/anilistcdn/staff/large/n95091-idoMaN26z80B.png",
                  "medium": "https://s4.anilist.co/file/anilistcdn/staff/medium/n95091-idoMaN26z80B.png"
                },
                "name": {
                  "full": "Jouji Nakata",
                  "native": "中田譲治"
                }
              }
            ]
          },
          {
            "role": "BACKGROUND",
            "node": {
              "id": 240936,
              "image": {
                "large": "https://s4.anilist.co/file/anilistcdn/character/large/b240936-pHHTccN4Qkug.png"
              },
              "name": {
                "full": "Carlos",
                "native": "カルロス"
              }
            },
            "voiceActors": [
              {
                "id": 96346,
                "image": {
                  "large": "https://s4.anilist.co/file/anilistcdn/staff/large/1346.jpg",
                  "medium": "https://s4.anilist.co/file/anilistcdn/staff/medium/1346.jpg"
                },
                "name": {
                  "full": "Toshihiko Nakajima",
                  "native": "中嶋聡彦"
                }
              }
            ]
          },
          {
            "role": "SUPPORTING",
            "node": {
              "id": 19118,
              "image": {
                "large": "https://s4.anilist.co/file/anilistcdn/character/large/b19118-5xDFbLvjIeLp.png"
              },
              "name": {
                "full": "Bull",
                "native": "ブル"
              }
            },
            "voiceActors": [
              {
                "id": 106923,
                "image": {
                  "large": "https://s4.anilist.co/file/anilistcdn/staff/large/11923.jpg",
                  "medium": "https://s4.anilist.co/file/anilistcdn/staff/medium/11923.jpg"
                },
                "name": {
                  "full": "Takehiro Koyama",
                  "native": "小山武宏"
                }
              }
            ]
          },
          {
            "role": "SUPPORTING",
            "node": {
              "id": 29559,
              "image": {
                "large": "https://s4.anilist.co/file/anilistcdn/character/large/b29559-qOTqO50T3EUx.png"
              },
              "name": {
                "full": "Abdul Hakim",
                "native": "ハキム"
              }
            },
            "voiceActors": [
              {
                "id": 95836,
                "image": {
                  "large": "https://s4.anilist.co/file/anilistcdn/staff/large/n95836-cHQyycQ0PWo2.jpg",
                  "medium": "https://s4.anilist.co/file/anilistcdn/staff/medium/n95836-cHQyycQ0PWo2.jpg"
                },
                "name": {
                  "full": "Ryuuzaburou Ootomo",
                  "native": "大友龍三郎"
                }
              }
            ]
          },
          {
            "role": "SUPPORTING",
            "node": {
              "id": 19119,
              "image": {
                "large": "https://s4.anilist.co/file/anilistcdn/character/large/b19119-dTpS5sAhlTD2.jpg"
              },
              "name": {
                "full": "Wen",
                "native": "ウェン"
              }
            },
            "voiceActors": [
              {
                "id": 95435,
                "image": {
                  "large": "https://s4.anilist.co/file/anilistcdn/staff/large/n95435-REiTyMQqIfH4.jpg",
                  "medium": "https://s4.anilist.co/file/anilistcdn/staff/medium/n95435-REiTyMQqIfH4.jpg"
                },
                "name": {
                  "full": "Yumi Touma",
                  "native": "冬馬由美"
                }
              }
            ]
          }
        ]
      }
    };
    test('detail_anime', () async {
      DetailAnimeDto.fromJson(dummyData);
    });
  });
}
