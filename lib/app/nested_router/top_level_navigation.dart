import 'package:aniflow/app/nested_router/ani_flow_route_path.dart';
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
  AniFlowRoutePath toRoutePath() {
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
