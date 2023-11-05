import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('activity_dto_from_json', () {
    final dummyListActivity = {
      "__typename": "ListActivity",
      "id": 615559531,
      "status": "watched episode",
      "progress": "1 - 11",
      "userId": 6378393,
      "type": "ANIME_LIST",
      "replyCount": 0,
      "siteUrl": "https://anilist.co/activity/615559531",
      "isLocked": false,
      "isLiked": false,
      "likeCount": 0,
      "isPinned": false,
      "createdAt": 1693751453,
      "user": {
        "id": 6378393,
        "name": "andannn",
        "avatar": {
          "large": "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b6378393-3BsPEhU6Tz5l.png",
          "medium": "https://s4.anilist.co/file/anilistcdn/user/avatar/medium/b6378393-3BsPEhU6Tz5l.png"
        },
        "bannerImage": "https://s4.anilist.co/file/anilistcdn/user/banner/b6378393-qmyrEYbiA2HR.jpg"
      }
    };
    final dummyTextActivity = {
      "__typename": "TextActivity",
      "id": 2,
      "text": "Welcome to 2.0 :)",
      "userId": 1,
      "type": "TEXT",
      "replyCount": 25,
      "siteUrl": "https://anilist.co/activity/2",
      "isLocked": true,
      "isLiked": false,
      "likeCount": 89,
      "isPinned": false,
      "createdAt": 1417356320,
      "user": {
        "id": 1,
        "name": "Josh",
        "avatar": {
          "large": "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b1-PPhlCaTCpmrV.png",
          "medium": "https://s4.anilist.co/file/anilistcdn/user/avatar/medium/b1-PPhlCaTCpmrV.png"
        },
        "bannerImage": "https://s4.anilist.co/file/anilistcdn/user/banner/n1-Uq15ejQKm1Kg.jpg"
      }
    };
    test('list_activity_dto', () async {
      ListActivityDto.fromJson(dummyListActivity);
    });
    test('text_activity_dto', () async {
      TextActivityDto.fromJson(dummyTextActivity);
    });
  });
}
