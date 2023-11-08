// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/network/model/airing_notification_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('notification_test', () {
    final dummyAiringNotification = {
      "__typename": "AiringNotification",
      "id": 467561733,
      "type": "AIRING",
      "animeId": 140501,
      "episode": 7,
      "contexts": ["Episode ", " of ", " aired."],
      "createdAt": 1699288203,
      "media": {
        "id": 140501,
        "type": "ANIME",
        "coverImage": {
          "extraLarge":
              "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx140501-pXY8yUDScfHS.jpg",
          "large":
              "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx140501-pXY8yUDScfHS.jpg",
          "medium":
              "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx140501-pXY8yUDScfHS.jpg",
          "color": "#35bbff"
        },
        "title": {
          "romaji": "Seiken Gakuin no Maken Tsukai",
          "english": "The Demon Sword Master of Excalibur Academy",
          "native": "聖剣学院の魔剣使い"
        }
      }
    };

    final dummyFollowNotification = {
      "__typename": "FollowingNotification",
      "id": 464823439,
      "userId": 6478504,
      "type": "FOLLOWING",
      "context": " started following you.",
      "createdAt": 1698582885,
      "user": {
        "id": 6478504,
        "name": "SubAcc",
        "avatar": {
          "large":
              "https://s4.anilist.co/file/anilistcdn/user/avatar/large/default.png",
          "medium":
              "https://s4.anilist.co/file/anilistcdn/user/avatar/medium/default.png"
        },
        "bannerImage": null
      }
    };

    final activityNotification = {
      "__typename": "ActivityReplyNotification",
      "id": 464823653,
      "userId": 6478504,
      "type": "ACTIVITY_REPLY",
      "activityId": 640108268,
      "context": " replied to your activity.",
      "createdAt": 1698582959,
      "activity": {
        "__typename": "ListActivity",
        "id": 640108268,
        "status": "watched episode",
        "progress": "4",
        "userId": 6378393,
        "type": "ANIME_LIST",
        "replyCount": 1,
        "siteUrl": "https://anilist.co/activity/640108268",
        "isLocked": false,
        "isLiked": false,
        "likeCount": 1,
        "isPinned": false,
        "createdAt": 1698561143,
        "user": null,
        "media": null
      },
      "user": {
        "id": 6478504,
        "name": "SubAcc",
        "avatar": {
          "large":
              "https://s4.anilist.co/file/anilistcdn/user/avatar/large/default.png",
          "medium":
              "https://s4.anilist.co/file/anilistcdn/user/avatar/medium/default.png"
        },
        "bannerImage": null
      }
    };

    final dummyRelatedMediaAdditionNotification = {
      "__typename": "RelatedMediaAdditionNotification",
      "id": 465097652,
      "type": "RELATED_MEDIA_ADDITION",
      "mediaId": 170596,
      "context": " was recently added to the site.",
      "createdAt": 1698626948,
      "media": {
        "id": 170596,
        "type": "MANGA",
        "format": "NOVEL",
        "status": "NOT_YET_RELEASED",
        "season": null,
        "coverImage": {
          "extraLarge":
              "https://s4.anilist.co/file/anilistcdn/media/manga/cover/large/bx170596-qnmbdCiv0ZGv.jpg",
          "large":
              "https://s4.anilist.co/file/anilistcdn/media/manga/cover/medium/bx170596-qnmbdCiv0ZGv.jpg",
          "medium":
              "https://s4.anilist.co/file/anilistcdn/media/manga/cover/small/bx170596-qnmbdCiv0ZGv.jpg",
          "color": "#f10dbb"
        },
        "title": {
          "romaji": "[Oshi no Ko]: Ichibanboshi no Spica",
          "english": null,
          "native": "【推しの子】～一番星のスピカ～"
        }
      }
    };
    test('airing_activity_notification', () async {
      final res = AniNotification.mapToAniNotification(dummyAiringNotification)
          as AiringNotificationDto;
      expect(res.runtimeType.toString().contains('AiringNotification'),
          equals(true));
      print(res);
    });

    test('following_notification_notification', () async {
      final res = AniNotification.mapToAniNotification(dummyFollowNotification);
      expect(res.runtimeType.toString().contains('FollowingNotification'),
          equals(true));
      print(res);
    });

    test('activity_reply_notification', () async {
      final res = AniNotification.mapToAniNotification(activityNotification);
      expect(res.runtimeType.toString().contains('ActivityReplyNotification'),
          equals(true));
      print(res);
    });

    test('related_media_addition_notification', () async {
      final res = AniNotification.mapToAniNotification(
          dummyRelatedMediaAdditionNotification);
      expect(res.runtimeType.toString().contains('RelatedMediaAdditionNotification'),
          equals(true));
      print(res);
    });
  });
}
