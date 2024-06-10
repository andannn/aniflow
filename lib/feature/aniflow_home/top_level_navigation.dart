import 'package:aniflow/feature/aniflow_home/discover/discover.dart';
import 'package:aniflow/feature/aniflow_home/media_track/media_track.dart';
import 'package:aniflow/feature/aniflow_home/social/social.dart';
import 'package:aniflow/feature/profile/profile.dart';
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
  Page toPage() {
    switch (this) {
      case TopLevelNavigation.discover:
        return DiscoverPage(key: ValueKey(toString()));
      case TopLevelNavigation.track:
        return AnimeTrackPage(key: ValueKey(toString()));
      case TopLevelNavigation.social:
        return SocialPage(key: ValueKey(toString()));
      case TopLevelNavigation.profile:
        return ProfilePage(key: ValueKey(toString()));
    }
  }
}
