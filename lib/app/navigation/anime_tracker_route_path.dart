import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/feature/anime_list/anime_list.dart';
import 'package:anime_tracker/feature/discover/discover.dart';
import 'package:flutter/material.dart';

sealed class AnimeTrackerRoutePath {}

abstract class TopLevelRoutePath extends AnimeTrackerRoutePath {
  final TopLevelNavigation topLevel;

  TopLevelRoutePath(this.topLevel);

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

class AnimeListRoutePath extends AnimeTrackerRoutePath {
  AnimeListRoutePath(this.category);

  final AnimeCategory category;
}

extension AnimeTrackerRoutePathEx on AnimeTrackerRoutePath {
  Page generatePage() {
    switch (this) {
      case DiscoverRoutePath(topLevel: final _):
        return const DiscoverPage(key: ValueKey('DiscoverPage'));
      case AnimeListRoutePath(category: final category):
        return AnimeListPage(key: const ValueKey('AnimeListPage'), category: category);
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}
