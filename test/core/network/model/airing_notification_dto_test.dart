// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/network/model/activity_like_notification_dto.dart';
import 'package:aniflow/core/network/model/airing_notification_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('notification_test', () {
    final airingNotification = {
      "__typename": "AiringNotification",
      "id": 464758426,
      "type": "AIRING",
      "animeId": 151970,
      "episode": 5,
      "contexts": ["Episode ", " of ", " aired."],
      "createdAt": 1698566410,
      "media": {"id": 151970}
    };

    final likeNotification = {
      "__typename": "ActivityLikeNotification",
      "id": 457867547,
      "userId": 5338139,
      "type": "ACTIVITY_LIKE",
      "context": " liked your activity.",
      "createdAt": 1696629541,
      "user": {"id": 5338139}
    };
    test('airing_notification', () async {
      AiringNotificationDto.fromJson(airingNotification);
    });
    test('like_notification', () async {
      ActivityLikeNotificationDto.fromJson(likeNotification);
    });
    test('resolve_type', () async {
      AniNotification.mapToAniNotification(likeNotification);
    });
  });
}
