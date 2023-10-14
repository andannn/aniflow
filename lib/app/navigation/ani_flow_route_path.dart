import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/feature/airing_schedule/airing_schedule.dart';
import 'package:anime_tracker/feature/anime_list/anime_list.dart';
import 'package:anime_tracker/feature/anime_search/anime_search.dart';
import 'package:anime_tracker/feature/anime_track/anime_track.dart';
import 'package:anime_tracker/feature/detail_anime/detail_anime.dart';
import 'package:anime_tracker/feature/discover/discover.dart';
import 'package:anime_tracker/feature/profile/profile.dart';
import 'package:flutter/material.dart';

sealed class AniFlowRoutePath {
  const AniFlowRoutePath();
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
  DiscoverRoutePath() : super(TopLevelNavigation.discover);
}

class TrackRoutePath extends TopLevelRoutePath {
  TrackRoutePath() : super(TopLevelNavigation.track);
}

class SearchRoutePath extends TopLevelRoutePath {
  SearchRoutePath() : super(TopLevelNavigation.search);
}

class ProfileRoutePath extends TopLevelRoutePath {
  ProfileRoutePath() : super(TopLevelNavigation.profile);
}

class AnimeListRoutePath extends AniFlowRoutePath {
  AnimeListRoutePath(this.category);

  final AnimeCategory category;
}

class DetailAnimeRoutePath extends AniFlowRoutePath {
  DetailAnimeRoutePath(this.animeId);

  final String animeId;
}

class AiringScheduleRoutePath extends AniFlowRoutePath {
  const AiringScheduleRoutePath();
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
      case DetailAnimeRoutePath(animeId: final animeId):
        return DetailAnimePage(
          key: ValueKey('DetailAnimeRoute_$animeId'),
          animeId: animeId,
        );
      case TrackRoutePath(topLevel: final _):
        return const AnimeTrackPage(key: ValueKey('AnimeTrackPage'));
      case SearchRoutePath(topLevel: final _):
        return const AnimeSearchPage(key: ValueKey('AnimeSearchPage'));
      case ProfileRoutePath(topLevel: final _):
        return const ProfilePage(key: ValueKey('ProfilePage'));
      case AiringScheduleRoutePath():
        return const AiringSchedule(key: ValueKey('AiringSchedule'));
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}
