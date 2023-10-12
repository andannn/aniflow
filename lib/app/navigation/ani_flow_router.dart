import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:flutter/material.dart';
import 'package:anime_tracker/app/navigation/ani_flow_route_path.dart';

class AnimeTrackerRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;

  RouteObserver routeObserver = RouteObserver();

  List<AniFlowRoutePath> _backStack = [DiscoverRoutePath()];

  /// get current path.
  AniFlowRoutePath get currentPath => _backStack.last;

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

  void navigateToAnimeList(AnimeCategory category) {
    _backStack += [AnimeListRoutePath(category)];

    notifyListeners();
  }

  void navigateToDetailAnime(String animeId) {
    _backStack += [DetailAnimeRoutePath(animeId)];

    notifyListeners();
  }

  void navigateToAiringSchedule() {
    _backStack += [const AiringScheduleRoutePath()];

    notifyListeners();
  }
}
