import 'package:aniflow/app/navigation/top_level_navigation.dart';
import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/anime_search/media_search.dart';
import 'package:aniflow/feature/character_page/character_page.dart';
import 'package:aniflow/feature/detail_media/detail_media.dart';
import 'package:aniflow/feature/discover/discover.dart';
import 'package:aniflow/feature/media_page/media_page.dart';
import 'package:aniflow/feature/media_track/media_track.dart';
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
import 'package:aniflow/feature/social/social.dart';
import 'package:aniflow/feature/staff_page/staff_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AniFlowRoutePath extends Equatable {
  const AniFlowRoutePath({this.isFullScreen = false});

  final bool isFullScreen;

  @override
  List<Object?> get props => [];
}

abstract class TopLevelRoutePath extends AniFlowRoutePath {
  final TopLevelNavigation topLevel;

  const TopLevelRoutePath(this.topLevel);

  @override
  List<Object?> get props => [topLevel];
}

class DiscoverRoutePath extends TopLevelRoutePath {
  const DiscoverRoutePath() : super(TopLevelNavigation.discover);
}

class TrackRoutePath extends TopLevelRoutePath {
  const TrackRoutePath() : super(TopLevelNavigation.track);
}

class SocialRoutePath extends TopLevelRoutePath {
  const SocialRoutePath() : super(TopLevelNavigation.social);
}

class ProfileRoutePath extends TopLevelRoutePath {
  const ProfileRoutePath() : super(TopLevelNavigation.profile);
}

class SearchRoutePath extends AniFlowRoutePath {
  const SearchRoutePath() : super(isFullScreen: true);
}

class FavoriteStaffPath extends AniFlowRoutePath {
  const FavoriteStaffPath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class FavoriteCharacterPath extends AniFlowRoutePath {
  const FavoriteCharacterPath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class FavoriteAnimePath extends AniFlowRoutePath {
  const FavoriteAnimePath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class FavoriteMangaPath extends AniFlowRoutePath {
  const FavoriteMangaPath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class WatchingAnimePath extends AniFlowRoutePath {
  const WatchingAnimePath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class CompletedAnimePath extends AniFlowRoutePath {
  const CompletedAnimePath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class DroppedAnimePath extends AniFlowRoutePath {
  const DroppedAnimePath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class ReadingMangaPath extends AniFlowRoutePath {
  const ReadingMangaPath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class DroppedMangaPath extends AniFlowRoutePath {
  const DroppedMangaPath(this.userId) : super(isFullScreen: true);
  final String userId;
}

class UserProfileRoutePath extends AniFlowRoutePath {
  const UserProfileRoutePath(this.userId) : super(isFullScreen: true);

  final String userId;
}

class AnimeListRoutePath extends AniFlowRoutePath {
  const AnimeListRoutePath(this.category) : super(isFullScreen: true);

  final MediaCategory category;

  @override
  List<Object?> get props => [category];
}

class CharacterListRoutePath extends AniFlowRoutePath {
  const CharacterListRoutePath(this.characterId) : super(isFullScreen: true);

  final String characterId;

  @override
  List<Object?> get props => [characterId];
}

class StaffListRoutePath extends AniFlowRoutePath {
  const StaffListRoutePath(this.staffId) : super(isFullScreen: true);

  final String staffId;

  @override
  List<Object?> get props => [staffId];
}

class DetailAnimeRoutePath extends AniFlowRoutePath {
  const DetailAnimeRoutePath(this.animeId) : super(isFullScreen: true);

  final String animeId;

  @override
  List<Object?> get props => [animeId];
}

class AiringScheduleRoutePath extends AniFlowRoutePath {
  const AiringScheduleRoutePath() : super(isFullScreen: true);
}

class NotificationRoutePath extends AniFlowRoutePath {
  const NotificationRoutePath() : super(isFullScreen: true);
}

extension AniFlowRoutePathEx on AniFlowRoutePath {
  Page generatePage() {
    switch (this) {
      case DiscoverRoutePath(topLevel: final _):
        return const DiscoverPage(key: ValueKey('DiscoverPage'));
      case AnimeListRoutePath(category: final category):
        return MediaListPage(
          key: ValueKey('AnimeListPage_$category'),
          category: category,
        );
      case CharacterListRoutePath(characterId: final animeId):
        return CharacterListPage(
          key: ValueKey('CharacterListPage_$animeId'),
          animeId: animeId,
        );
      case StaffListRoutePath(staffId: final animeId):
        return StaffListPage(
          key: ValueKey('StaffListPage_$animeId'),
          animeId: animeId,
        );
      case DetailAnimeRoutePath(animeId: final animeId):
        return DetailAnimePage(
          key: ValueKey('DetailAnimeRoute_$animeId'),
          animeId: animeId,
        );
      case TrackRoutePath(topLevel: final _):
        return const AnimeTrackPage(key: ValueKey('AnimeTrackPage'));
      case SocialRoutePath(topLevel: final _):
        return const SocialPage(key: ValueKey('SocialPage'));
      case ProfileRoutePath(topLevel: final _):
        return const ProfilePage(key: ValueKey('ProfilePage'));
      case UserProfileRoutePath(userId: final id):
        return ProfilePage(key: ValueKey('ProfilePage_$id'), userId: id);
      case AiringScheduleRoutePath():
        return const AiringSchedule(key: ValueKey('AiringSchedule'));
      case SearchRoutePath():
        return const SearchPage(key: ValueKey('SearchPage'));
      case NotificationRoutePath():
        return const NotificationPage(key: ValueKey('NotificationPage'));
      case FavoriteStaffPath(userId: final id):
        return FavoriteStaffListPage(
            key: ValueKey('FavoriteStaffPath_$id'), userId: id);
      case FavoriteCharacterPath(userId: final id):
        return FavoriteCharacterListPage(
            key: ValueKey('FavoriteCharacterListPage_$id'), userId: id);
      case FavoriteAnimePath(userId: final id):
        return FavoriteAnimeListPage(
            key: ValueKey('FavoriteAnimeListPage_$id'), userId: id);
      case FavoriteMangaPath(userId: final id):
        return FavoriteMangaListPage(
            key: ValueKey('FavoriteMangaListPage_$id'), userId: id);
      case WatchingAnimePath(userId: final id):
        return WatchingAnimePage(
            key: ValueKey('WatchingAnimePage_$id'), userId: id);
      case CompletedAnimePath(userId: final id):
        return CompletedAnimePage(
            key: ValueKey('CompletedAnimePage_$id'), userId: id);
      case DroppedAnimePath(userId: final id):
        return DroppedAnimePage(
            key: ValueKey('DroppedAnimePage_$id'), userId: id);
      case DroppedMangaPath(userId: final id):
        return DroppedMangaPage(
            key: ValueKey('DroppedMangaPage_$id'), userId: id);
      case ReadingMangaPath(userId: final id):
        return ReadingMangaPage(
            key: ValueKey('ReadingMangaPage_$id'), userId: id);
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}
