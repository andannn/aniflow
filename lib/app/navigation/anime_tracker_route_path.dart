import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
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

class TopicRoutePath extends AnimeTrackerRoutePath {
  TopicRoutePath(this.topicId);
  final String topicId;
}

extension AnimeTrackerRoutePathEx on AnimeTrackerRoutePath {
  Page generatePage() {
    switch(this) {
      case DiscoverRoutePath(topLevel: final _):
        return MaterialPage(key: UniqueKey(), child: const DiscoverPage());
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}