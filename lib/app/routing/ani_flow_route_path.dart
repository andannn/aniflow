import 'package:aniflow/core/common/definitions/anime_category.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/aniflow_home/ani_flow_home.dart';
import 'package:aniflow/feature/character_page/character_page.dart';
import 'package:aniflow/feature/detail_character/detail_character.dart';
import 'package:aniflow/feature/detail_media/detail_media.dart';
import 'package:aniflow/feature/detail_staff/detail_staff.dart';
import 'package:aniflow/feature/detail_studio/detail_studio.dart';
import 'package:aniflow/feature/media_page/media_page.dart';
import 'package:aniflow/feature/notification/notification.dart';
import 'package:aniflow/feature/profile/profile.dart';
import 'package:aniflow/feature/profile/sub_favorite/pages/favorite_anime_page.dart';
import 'package:aniflow/feature/profile/sub_favorite/pages/favorite_character_page.dart';
import 'package:aniflow/feature/profile/sub_favorite/pages/favorite_manga_page.dart';
import 'package:aniflow/feature/profile/sub_favorite/pages/favorite_staff_page.dart';
import 'package:aniflow/feature/profile/sub_media_list/pages/completed_anime_list_page.dart';
import 'package:aniflow/feature/profile/sub_media_list/pages/dropped_anime_list_page.dart';
import 'package:aniflow/feature/profile/sub_media_list/pages/dropped_manga_list_page.dart';
import 'package:aniflow/feature/profile/sub_media_list/pages/reading_manga_list_page.dart';
import 'package:aniflow/feature/profile/sub_media_list/pages/watching_anime_list_page.dart';
import 'package:aniflow/feature/search/search_page.dart';
import 'package:aniflow/feature/social/activity_replies/activity_replies.dart';
import 'package:aniflow/feature/staff_page/staff_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AniFlowRoutePath extends Equatable {
  const AniFlowRoutePath({this.isFullScreen = false});

  final bool isFullScreen;

  @override
  List<Object?> get props => [];
}


class AniFlowHomePath extends AniFlowRoutePath {
  const AniFlowHomePath() : super(isFullScreen: true);

  @override
  String toString() => 'home_page';
}

class SearchRoutePath extends AniFlowRoutePath {
  const SearchRoutePath() : super(isFullScreen: true);

  @override
  String toString() => 'search_page';
}

class FavoriteStaffListPath extends AniFlowRoutePath {
  const FavoriteStaffListPath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'favorite_staff_list_page_$id';
}

class FavoriteCharacterListPath extends AniFlowRoutePath {
  const FavoriteCharacterListPath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'favorite_character_list_page_$id';
}

class FavoriteAnimeListPath extends AniFlowRoutePath {
  const FavoriteAnimeListPath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'favorite_anime_list_page_$id';
}

class FavoriteMangaListPath extends AniFlowRoutePath {
  const FavoriteMangaListPath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'favorite_manga_list_page_$id';
}

class WatchingAnimeListPath extends AniFlowRoutePath {
  const WatchingAnimeListPath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'watching_anime_list_page_$id';
}

class CompletedAnimePath extends AniFlowRoutePath {
  const CompletedAnimePath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'completed_anime_list_page_$id';
}

class DroppedAnimePath extends AniFlowRoutePath {
  const DroppedAnimePath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'dropped_anime_list_page_$id';
}

class ReadingMangaPath extends AniFlowRoutePath {
  const ReadingMangaPath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'reading_manga_list_page_$id';
}

class DroppedMangaPath extends AniFlowRoutePath {
  const DroppedMangaPath(this.id) : super(isFullScreen: true);
  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'dropped_manga_list_page_$id';
}

class UserProfileRoutePath extends AniFlowRoutePath {
  const UserProfileRoutePath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'user_profile_page_$id';
}

class CategoryAnimeListRoutePath extends AniFlowRoutePath {
  const CategoryAnimeListRoutePath(this.category) : super(isFullScreen: true);

  final MediaCategory category;

  @override
  List<Object?> get props => [category];

  @override
  String toString() => 'category_anime_list_page:category_${category.name}';
}

class MediaCharacterListRoutePath extends AniFlowRoutePath {
  const MediaCharacterListRoutePath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'media_character_list_page_$id';
}

class MediaStaffListRoutePath extends AniFlowRoutePath {
  const MediaStaffListRoutePath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'media_staff_list_page_$id';
}

class DetailMediaRoutePath extends AniFlowRoutePath {
  const DetailMediaRoutePath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'detail_media_page_$id';
}

class DetailCharacterPath extends AniFlowRoutePath {
  const DetailCharacterPath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'detail_character_page_$id';
}

class DetailStaffPath extends AniFlowRoutePath {
  const DetailStaffPath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'detail_staff_page_$id';
}

class AiringScheduleRoutePath extends AniFlowRoutePath {
  const AiringScheduleRoutePath() : super(isFullScreen: true);

  @override
  String toString() => 'airing_schedule_page';
}

class NotificationRoutePath extends AniFlowRoutePath {
  const NotificationRoutePath() : super(isFullScreen: true);

  @override
  String toString() => 'notification_page';
}

class DetailStudioRoutePath extends AniFlowRoutePath {
  const DetailStudioRoutePath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'detail_studio_page_$id';
}

class ActivityRepliesRoutePath extends AniFlowRoutePath {
  const ActivityRepliesRoutePath(this.id) : super(isFullScreen: true);

  final String id;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'activity_replies_page_$id';
}

extension AniFlowRoutePathEx on AniFlowRoutePath {
  Page generatePage() {
    switch (this) {
      case AniFlowHomePath():
        return AniFlowHomePage(key: ValueKey(toString()));
      case CategoryAnimeListRoutePath(category: final category):
        return MediaListPage(key: ValueKey(toString()), category: category);
      case MediaCharacterListRoutePath(id: final animeId):
        return CharacterListPage(key: ValueKey(toString()), animeId: animeId);
      case MediaStaffListRoutePath(id: final animeId):
        return StaffListPage(key: ValueKey(toString()), animeId: animeId);
      case DetailMediaRoutePath(id: final animeId):
        return DetailAnimePage(key: ValueKey(toString()), animeId: animeId);
      case UserProfileRoutePath(id: final id):
        return ProfilePage(
          key: ValueKey(toString()),
          userId: id,
          showBackKey: true,
        );
      case AiringScheduleRoutePath():
        return AiringSchedule(key: ValueKey(toString()));
      case SearchRoutePath():
        return SearchPage(key: ValueKey(toString()));
      case NotificationRoutePath():
        return NotificationPage(key: ValueKey(toString()));
      case FavoriteStaffListPath(id: final id):
        return FavoriteStaffListPage(key: ValueKey(toString()), userId: id);
      case FavoriteCharacterListPath(id: final id):
        return FavoriteCharacterListPage(key: ValueKey(toString()), userId: id);
      case FavoriteAnimeListPath(id: final id):
        return FavoriteAnimeListPage(key: ValueKey(toString()), userId: id);
      case FavoriteMangaListPath(id: final id):
        return FavoriteMangaListPage(key: ValueKey(toString()), userId: id);
      case WatchingAnimeListPath(id: final id):
        return WatchingAnimePage(key: ValueKey(toString()), userId: id);
      case CompletedAnimePath(id: final id):
        return CompletedAnimePage(key: ValueKey(toString()), userId: id);
      case DroppedAnimePath(id: final id):
        return DroppedAnimePage(key: ValueKey(toString()), userId: id);
      case DroppedMangaPath(id: final id):
        return DroppedMangaPage(key: ValueKey(toString()), userId: id);
      case ReadingMangaPath(id: final id):
        return ReadingMangaPage(key: ValueKey(toString()), userId: id);
      case DetailCharacterPath(id: final id):
        return DetailCharacterPage(key: ValueKey(toString()), id: id);
      case DetailStaffPath(id: final id):
        return DetailStaffPage(key: ValueKey(toString()), id: id);
      case DetailStudioRoutePath(id: final id):
        return DetailStudioPage(key: ValueKey(toString()), id: id);
      case ActivityRepliesRoutePath(id: final id):
        return ActivityRepliesPage(key: ValueKey(toString()), activityId: id);
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}
