import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
import 'package:flutter/material.dart';
import 'anime_tracker_route_path.dart';

class AnimeTrackerRouterDelegate extends RouterDelegate<AnimeTrackerRoutePath>
    with ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;

  RouteObserver routeObserver = RouteObserver();

  List<AnimeTrackerRoutePath> _backStack = [DiscoverRoutePath()];

  /// get current path.
  AnimeTrackerRoutePath get currentPath => _backStack.last;

  /// get current top level.
  TopLevelNavigation get currentTopLevelNavigation =>
      _backStack
          .whereType<TopLevelRoutePath>()
          .last
          .topLevel;

  bool get needShowTopAppBar => _backStack.last is TopLevelRoutePath;

  static AnimeTrackerRouterDelegate of(context) =>
      Router
          .of(context)
          .routerDelegate as AnimeTrackerRouterDelegate;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _backStack.map((path) => path.generatePage()).toList(),
      onPopPage: _onPopPage,
      observers: [routeObserver],
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    _backStack.removeLast();
    notifyListeners();
    return true;
  }

  @override
  Future<bool> popRoute() async {
    if (currentPath is DiscoverRoutePath) {
      // Already in last page, nothing to do, just quit app.
      return false;
    }

    navigator?.pop();
    return true;
  }

  void navigateToTopLevelPage(TopLevelNavigation navigation) {
    if (navigation == TopLevelNavigation.discover) {
      _backStack = [DiscoverRoutePath()];
    } else {
      _backStack = [DiscoverRoutePath(), navigation.toRoutePath()];
    }

    notifyListeners();
  }

  void navigateToTopicDetail(String topicId) {
    _backStack += [TopicRoutePath(topicId)];

    notifyListeners();
  }
}
