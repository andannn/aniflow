import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/feature/airing_schedule/airing_schedule.dart';
import 'package:anime_tracker/feature/anime_page/anime_page.dart';
import 'package:anime_tracker/feature/anime_search/anime_search.dart';
import 'package:anime_tracker/feature/anime_track/anime_track.dart';
import 'package:anime_tracker/feature/character_page/character_page.dart';
import 'package:anime_tracker/feature/detail_anime/detail_anime.dart';
import 'package:anime_tracker/feature/discover/discover.dart';
import 'package:anime_tracker/feature/forum/profile.dart';
import 'package:anime_tracker/feature/profile/profile.dart';
import 'package:anime_tracker/feature/staff_page/staff_page.dart';
import 'package:flutter/material.dart';

sealed class AniFlowRoutePath {
  const AniFlowRoutePath({this.isFullScreen = false});

  final bool isFullScreen;
}

abstract class TopLevelRoutePath extends AniFlowRoutePath {
  final TopLevelNavigation topLevel;

  const TopLevelRoutePath(this.topLevel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopLevelRoutePath &&
          runtimeType == other.runtimeType &&
          topLevel == other.topLevel;

  @override
  int get hashCode => topLevel.hashCode;
}

class DiscoverRoutePath extends TopLevelRoutePath {
  const DiscoverRoutePath() : super(TopLevelNavigation.discover);
}

class TrackRoutePath extends TopLevelRoutePath {
  const TrackRoutePath() : super(TopLevelNavigation.track);
}

class ForumRoutePath extends TopLevelRoutePath {
  const ForumRoutePath() : super(TopLevelNavigation.forum);
}

class ProfileRoutePath extends TopLevelRoutePath {
  const ProfileRoutePath() : super(TopLevelNavigation.profile);
}

class SearchRoutePath extends AniFlowRoutePath {
  const SearchRoutePath() : super(isFullScreen: true);
}

class AnimeListRoutePath extends AniFlowRoutePath {
  const AnimeListRoutePath(this.category) : super(isFullScreen: true);

  final AnimeCategory category;
}

class CharacterListRoutePath extends AniFlowRoutePath {
  const CharacterListRoutePath(this.animeId) : super(isFullScreen: true);

  final String animeId;
}

class StaffListRoutePath extends AniFlowRoutePath {
  const StaffListRoutePath(this.animeId) : super(isFullScreen: true);

  final String animeId;
}

class DetailAnimeRoutePath extends AniFlowRoutePath {
  const DetailAnimeRoutePath(this.animeId) : super(isFullScreen: true);

  final String animeId;
}

class AiringScheduleRoutePath extends AniFlowRoutePath {
  const AiringScheduleRoutePath() : super(isFullScreen: true);
}

extension AniFlowRoutePathEx on AniFlowRoutePath {
  Page generatePage() {
    switch (this) {
      case DiscoverRoutePath(topLevel: final _):
        return const DiscoverPage(key: ValueKey('DiscoverPage'));
      case AnimeListRoutePath(category: final category):
        return AnimeListPage(
          key: ValueKey('AnimeListPage_$category'),
          category: category,
        );
      case CharacterListRoutePath(animeId: final animeId):
        return CharacterListPage(
          key: ValueKey('CharacterListPage_$animeId'),
          animeId: animeId,
        );
      case StaffListRoutePath(animeId: final animeId):
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
      case ForumRoutePath(topLevel: final _):
        return const ForumPage(key: ValueKey('ForumPage'));
      case ProfileRoutePath(topLevel: final _):
        return const ProfilePage(key: ValueKey('ProfilePage'));
      case AiringScheduleRoutePath():
        return const AiringSchedule(key: ValueKey('AiringSchedule'));
      case SearchRoutePath():
        return const SearchPage(key: ValueKey('SearchPage'));
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}
