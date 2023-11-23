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
      _backStack.whereType<TopLevelRoutePath>().last.topLevel;

  bool get isTopRouteFullScreen => _backStack.last.isFullScreen;

  static BuildContext? _routerContext;

  static AFRouterDelegate of([BuildContext? context]) =>
      Router.of(context ?? _routerContext!).routerDelegate as AFRouterDelegate;

  @override
  Widget build(BuildContext context) {
    _routerContext = context;
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
    _pushAsSingleton(AnimeListRoutePath(category));
  }

  void navigateToCharacterList(String characterId) {
    _pushAsSingleton(CharacterListRoutePath(characterId));
  }

  void navigateToStaffList(String staffId) {
    _pushAsSingleton(StaffListRoutePath(staffId));
  }

  void navigateToDetailMedia(String animeId) {
    _pushAsSingleton(DetailAnimeRoutePath(animeId));
  }

  void navigateToAiringSchedule() {
    _pushAsSingleton(const AiringScheduleRoutePath());
  }

  void navigateToSearch() {
    _pushAsSingleton(const SearchRoutePath());
  }

  void navigateToNotification() {
    _pushAsSingleton(const NotificationRoutePath());
  }

  void navigateToUserProfile(String userId) {
    _pushAsSingleton(UserProfileRoutePath(userId));
  }

  void _pushAsSingleton(AniFlowRoutePath path) {
    if (_backStack.contains(path)) {
      _backStack.remove(path);
    }

    _backStack += [path];

    notifyListeners();
  }
}
