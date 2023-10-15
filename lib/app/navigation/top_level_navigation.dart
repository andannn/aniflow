import 'package:anime_tracker/app/navigation/ani_flow_route_path.dart';
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
  search(
    selectedIcon: Icons.forum,
    unSelectedIcon: Icons.forum_outlined,
    iconTextId: 'Forum',
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
  NavigationDestination toBottomNavigationBarItem({required bool isSelected}) {
    final icon = isSelected ? selectedIcon : unSelectedIcon;
    return NavigationDestination(
      label: iconTextId,
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
    );
  }

  AniFlowRoutePath toRoutePath() {
    switch (this) {
      case TopLevelNavigation.discover:
        return DiscoverRoutePath();
      case TopLevelNavigation.track:
        return TrackRoutePath();
      case TopLevelNavigation.search:
        return SearchRoutePath();
      case TopLevelNavigation.profile:
        return ProfileRoutePath();
    }
  }
}
