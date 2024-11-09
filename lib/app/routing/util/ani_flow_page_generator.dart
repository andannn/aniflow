import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:aniflow/feature/activity_replies/activity_replies.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/aniflow_home/ani_flow_home.dart';
import 'package:aniflow/feature/birthday_characters_page/birthday_characters_page.dart';
import 'package:aniflow/feature/character_page/character_page.dart';
import 'package:aniflow/feature/detail_character/detail_character.dart';
import 'package:aniflow/feature/detail_media/detail_media.dart';
import 'package:aniflow/feature/detail_staff/detail_staff.dart';
import 'package:aniflow/feature/detail_studio/detail_studio.dart';
import 'package:aniflow/feature/image_preview/image_preview.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_update_page.dart';
import 'package:aniflow/feature/media_page/media_page.dart';
import 'package:aniflow/feature/notification/notification.dart';
import 'package:aniflow/feature/profile/profile.dart';
import 'package:aniflow/feature/search/search_page.dart';
import 'package:aniflow/feature/settings/settings.dart';
import 'package:aniflow/feature/staff_page/staff_page.dart';
import 'package:flutter/material.dart';

extension AniFlowRoutePathEx on AniFlowRoutePath {
  static void _defaultPopInvokedHandler(bool didPop, Object? result) {}

  Page generatePage(
      {PopInvokedWithResultCallback onPopInvoked = _defaultPopInvokedHandler}) {
    switch (this) {
      case AniFlowHomePath():
        return AniFlowHomePage(
          key: ValueKey(toString()),
          onPopInvoked: onPopInvoked,
        );
      case CategoryAnimeListRoutePath(category: final category):
        return MediaListPage(
          key: ValueKey(toString()),
          category: category,
          onPopInvoked: onPopInvoked,
        );
      case MediaCharacterListRoutePath(id: final animeId):
        return CharacterListPage(
          key: ValueKey(toString()),
          animeId: animeId,
          onPopInvoked: onPopInvoked,
        );
      case MediaStaffListRoutePath(id: final animeId):
        return StaffListPage(
          key: ValueKey(toString()),
          animeId: animeId,
          onPopInvoked: onPopInvoked,
        );
      case DetailMediaRoutePath(id: final animeId):
        return DetailAnimePage(
          key: ValueKey(toString()),
          animeId: animeId,
          onPopInvoked: onPopInvoked,
        );
      case UserProfileRoutePath(id: final id):
        return ProfilePage(
          key: ValueKey(toString()),
          userId: id,
          isFullScreenPageRoute: true,
          onPopInvoked: onPopInvoked,
        );
      case AiringScheduleRoutePath(type: final type):
        return AiringSchedule(
          key: ValueKey(toString()),
          scheduleType: type,
          onPopInvoked: onPopInvoked,
        );
      case SearchRoutePath():
        return SearchPage(
          key: ValueKey(toString()),
          onPopInvoked: onPopInvoked,
        );
      case NotificationRoutePath():
        return NotificationPage(
          key: ValueKey(toString()),
          onPopInvoked: onPopInvoked,
        );
      case DetailCharacterPath(id: final id):
        return DetailCharacterPage(
          key: ValueKey(toString()),
          id: id,
          onPopInvoked: onPopInvoked,
        );
      case DetailStaffPath(id: final id):
        return DetailStaffPage(
          key: ValueKey(toString()),
          id: id,
          onPopInvoked: onPopInvoked,
        );
      case DetailStudioRoutePath(id: final id):
        return DetailStudioPage(
          key: ValueKey(toString()),
          id: id,
          onPopInvoked: onPopInvoked,
        );
      case ActivityRepliesRoutePath(id: final id):
        return ActivityRepliesPage(
          key: ValueKey(toString()),
          activityId: id,
          onPopInvoked: onPopInvoked,
        );
      case ImagePreviewRoutePath(source: final source):
        return ImagePreviewPage(
          key: ValueKey(toString()),
          source: source,
          onPopInvoked: onPopInvoked,
        );
      case MediaListUpdateRoutePath(mediaId: final mediaId, from: final from):
        return UpdateMediaListPage(
          key: ValueKey(toString()),
          mediaId: mediaId,
          from: from,
          onPopInvoked: onPopInvoked,
        );
      case BirthdayCharacterPagePath():
        return BirthdayCharactersPage(
          key: ValueKey(toString()),
          onPopInvoked: onPopInvoked,
        );
      case SettingsRoutePath():
        return SettingsPage(
          key: ValueKey(toString()),
          onPopInvoked: onPopInvoked,
        );
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}
