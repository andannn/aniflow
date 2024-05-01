import 'package:aniflow/feature/discover/discover.dart';
import 'package:aniflow/feature/media_track/media_track.dart';
import 'package:aniflow/feature/profile/profile.dart';
import 'package:aniflow/feature/social/social.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TopLevelNavigation {
  discover(
      selectedIcon: Icons.explore,
      unSelectedIcon: Icons.explore_outlined,
      iconTextId: 'Home'),
  track(
    selectedIcon: Icons.collections_bookmark,
    unSelectedIcon: Icons.collections_bookmark_outlined,
    iconTextId: 'Track',
  ),
  social(
    selectedIcon: Icons.forum,
    unSelectedIcon: Icons.forum_outlined,
    iconTextId: 'Social',
  ),
  profile(
    selectedIcon: Icons.person,
    unSelectedIcon: Icons.person_outline,
    iconTextId: 'Profile',
  );

  const TopLevelNavigation({
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.iconTextId,
  });

  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String iconTextId;
}

extension TopLevelNavigationEx on TopLevelNavigation {
  TopLevelRoutePath toRoutePath() {
    switch (this) {
      case TopLevelNavigation.discover:
        return const DiscoverRoutePath();
      case TopLevelNavigation.track:
        return const TrackRoutePath();
      case TopLevelNavigation.social:
        return const SocialRoutePath();
      case TopLevelNavigation.profile:
        return const ProfileRoutePath();
    }
  }
}

sealed class TopLevelRoutePath extends Equatable {
  final TopLevelNavigation topLevel;

  const TopLevelRoutePath(this.topLevel);

  @override
  List<Object?> get props => [topLevel];
}

class DiscoverRoutePath extends TopLevelRoutePath {
  const DiscoverRoutePath() : super(TopLevelNavigation.discover);

  @override
  String toString() => 'discover_page';
}

class TrackRoutePath extends TopLevelRoutePath {
  const TrackRoutePath() : super(TopLevelNavigation.track);

  @override
  String toString() => 'track_page';
}

class SocialRoutePath extends TopLevelRoutePath {
  const SocialRoutePath() : super(TopLevelNavigation.social);

  @override
  String toString() => 'social_page';
}

class ProfileRoutePath extends TopLevelRoutePath {
  const ProfileRoutePath() : super(TopLevelNavigation.profile);

  @override
  String toString() => 'profile_page';
}

extension TopLevelRoutePathEv on TopLevelRoutePath {
  Page generatePage() {
    final path = this;

    switch (path) {
      case DiscoverRoutePath():
        return DiscoverPage(key: ValueKey(toString()));
      case TrackRoutePath():
        return AnimeTrackPage(key: ValueKey(toString()));
      case SocialRoutePath():
        return SocialPage(key: ValueKey(toString()));
      case ProfileRoutePath():
        return ProfilePage(key: ValueKey(toString()));
    }
  }
}
