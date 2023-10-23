import 'package:aniflow/app/navigation/ani_flow_route_path.dart';
import 'package:aniflow/app/navigation/top_level_navigation.dart';
import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:flutter/material.dart';

class AFRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;

  RouteObserver routeObserver = RouteObserver();

  List<AniFlowRoutePath> _backStack = [const DiscoverRoutePath()];

  /// get current path.
  AniFlowRoutePath get currentPath => _backStack.last;

  /// get current top level.
  TopLevelNavigation get currentTopLevelNavigation =>
      _backStack
          .whereType<TopLevelRoutePath>()
          .last
          .topLevel;

  bool get isTopRouteFullScreen => _backStack.last.isFullScreen;

  bool get isTopLevelNavigation => _backStack.last is TopLevelRoutePath;

  static AFRouterDelegate of(context) =>
      Router
          .of(context)
          .routerDelegate as AFRouterDelegate;

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
      _backStack = [const DiscoverRoutePath()];
    } else {
      _backStack = [const DiscoverRoutePath(), navigation.toRoutePath()];
    }

    notifyListeners();
  }

  void navigateToAnimeList(MediaCategory category) {
    _backStack += [AnimeListRoutePath(category)];

    notifyListeners();
  }

  void navigateToCharacterList(String animeId) {
    _backStack += [CharacterListRoutePath(animeId)];

    notifyListeners();
  }

  void navigateToStaffList(String animeId) {
    _backStack += [StaffListRoutePath(animeId)];

    notifyListeners();
  }

  void navigateToDetailMedia(String animeId) {
    _backStack += [DetailAnimeRoutePath(animeId)];

    notifyListeners();
  }

  void navigateToAiringSchedule() {
    _backStack += [const AiringScheduleRoutePath()];

    notifyListeners();
  }

  void navigateToSearch() {
    _backStack += [const SearchRoutePath()];

    notifyListeners();
  }
}
