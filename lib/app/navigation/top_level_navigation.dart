import 'package:flutter/material.dart';

import 'anime_tracker_route_path.dart';

enum TopLevelNavigation {
  discover(
    selectedIcon: Icons.home_filled,
    unSelectedIcon: Icons.home_outlined,
    iconTextId: 'Discover'
  ),
  bookMark(
      selectedIcon: Icons.bookmark,
      unSelectedIcon: Icons.bookmark_add_outlined,
      iconTextId: 'Saved',
  ),
  interests(
      selectedIcon: Icons.interests,
      unSelectedIcon: Icons.interests_outlined,
      iconTextId: 'interests',
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

  AnimeTrackerRoutePath toRoutePath() {
    switch (this) {
      case TopLevelNavigation.discover:
        return DiscoverRoutePath();
      case TopLevelNavigation.bookMark:
        return DiscoverRoutePath();
      case TopLevelNavigation.interests:
        return DiscoverRoutePath();
    }
  }
}
