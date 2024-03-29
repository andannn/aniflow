// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/app/aniflow_router/top_level_navigation.dart';
import 'package:aniflow/core/common/definitions/anime_category.dart';
import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

class AfRouterBackStack with ChangeNotifier {
  List<AniFlowRoutePath> get stack => _backStack;

  List<AniFlowRoutePath> _backStack = [];

  /// get current path.
  AniFlowRoutePath get currentPath => _backStack.last;

  /// get current top level.
  TopLevelNavigation get currentTopLevelNavigation =>
      _backStack.whereType<TopLevelRoutePath>().last.topLevel;

  bool get isTopRouteFullScreen => _backStack.lastOrNull?.isFullScreen ?? true;

  void navigateToTopLevelPage(TopLevelNavigation navigation) {
    if (navigation == TopLevelNavigation.discover) {
      _backStack = [const DiscoverRoutePath()];
    } else {
      _backStack = [const DiscoverRoutePath(), navigation.toRoutePath()];
    }

    notifyListeners();

    FirebaseAnalytics.instance.logAniFlowPathChangeEvent(navigation.toRoutePath());
  }

  void navigateToAnimeList(MediaCategory category) {
    _pushAsSingleton(CategoryAnimeListRoutePath(category));
  }

  void navigateToCharacterList(String characterId) {
    _pushAsSingleton(MediaCharacterListRoutePath(characterId));
  }

  void navigateToStaffList(String staffId) {
    _pushAsSingleton(MediaStaffListRoutePath(staffId));
  }

  void navigateToDetailMedia(String animeId) {
    _pushAsSingleton(DetailMediaRoutePath(animeId));
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

  void navigateToFavoritePage(FavoriteType type, String userId) {
    switch (type) {
      case FavoriteType.anime:
        _pushAsSingleton(FavoriteAnimeListPath(userId));
      case FavoriteType.manga:
        _pushAsSingleton(FavoriteMangaListPath(userId));
      case FavoriteType.character:
        _pushAsSingleton(FavoriteCharacterListPath(userId));
      case FavoriteType.staff:
        _pushAsSingleton(FavoriteStaffListPath(userId));
    }
  }

  void navigateToMediaListPage(MediaList type, String userId) {
    switch (type) {
      case WatchingAnimeList():
        _pushAsSingleton(WatchingAnimeListPath(userId));
      case CompletedAnimeList():
        _pushAsSingleton(CompletedAnimePath(userId));
      case DroppedAnimeList():
        _pushAsSingleton(DroppedAnimePath(userId));
      case ReadingMangaList():
        _pushAsSingleton(ReadingMangaPath(userId));
      case DroppedMangaList():
        _pushAsSingleton(DroppedMangaPath(userId));
    }
  }

  void navigateToDetailCharacter(String id) {
    _pushAsSingleton(DetailCharacterPath(id));
  }

  void navigateToDetailStaff(String id) {
    _pushAsSingleton(DetailStaffPath(id));
  }

  void navigateToDetailStudio(String id) {
    _pushAsSingleton(DetailStudioRoutePath(id));
  }

  void navigateToActivityRepliesPage(String id) {
    _pushAsSingleton(ActivityRepliesRoutePath(id));
  }

  void popBackStack() {
    _backStack.removeLast();
    notifyListeners();

    final topPageOrNull = _backStack.lastOrNull;
    if (topPageOrNull != null) {
      FirebaseAnalytics.instance.logAniFlowPathChangeEvent(topPageOrNull);
    }
  }

  void _pushAsSingleton(AniFlowRoutePath path) {
    if (_backStack.contains(path)) {
      _backStack.remove(path);
    }

    _backStack += [path];

    notifyListeners();

    FirebaseAnalytics.instance.logAniFlowPathChangeEvent(path);
  }

  void setNewRoutePath(AniFlowRoutePath path) {
    _pushAsSingleton(path);
  }
}
