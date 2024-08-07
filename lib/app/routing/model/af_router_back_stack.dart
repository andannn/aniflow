// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/image_preview/preview_source.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

mixin AfRouterBackStackMixin
    on ChangeNotifier, RouterDelegate<AniFlowRoutePath> {
  GlobalKey<RootNavigatorWidgetState> get backStackKey;

  RestorableAfStack get stack => backStackKey.currentState!.restorableAfStack;

  /// get current path.
  AniFlowRoutePath get currentPath => stack.value.last;

  void navigateToAnimeList(MediaCategory category) {
    _pushAsSingleton(CategoryAnimeListRoutePath(category: category));
  }

  void navigateToCharacterList(String characterId) {
    _pushAsSingleton(MediaCharacterListRoutePath(id: characterId));
  }

  void navigateToStaffList(String staffId) {
    _pushAsSingleton(MediaStaffListRoutePath(id: staffId));
  }

  void navigateToDetailMedia(String animeId) {
    _pushAsSingleton(DetailMediaRoutePath(id: animeId));
  }

  void navigateToAiringSchedule({ScheduleType type = ScheduleType.bangumi}) {
    _pushAsSingleton(AiringScheduleRoutePath(type: type));
  }

  void navigateToSearch() {
    _pushAsSingleton(const SearchRoutePath());
  }

  void navigateToNotification() {
    _pushAsSingleton(const NotificationRoutePath());
  }

  void navigateToUserProfile(String userId) {
    _pushAsSingleton(UserProfileRoutePath(id: userId));
  }

  void navigateToFavoritePage(FavoriteType type, String userId) {
    switch (type) {
      case FavoriteType.anime:
        _pushAsSingleton(FavoriteAnimeListPath(id: userId));
      case FavoriteType.manga:
        _pushAsSingleton(FavoriteMangaListPath(id: userId));
      case FavoriteType.character:
        _pushAsSingleton(FavoriteCharacterListPath(id: userId));
      case FavoriteType.staff:
        _pushAsSingleton(FavoriteStaffListPath(id: userId));
    }
  }

  void navigateToDetailCharacter(String id) {
    _pushAsSingleton(DetailCharacterPath(id: id));
  }

  void navigateToDetailStaff(String id) {
    _pushAsSingleton(DetailStaffPath(id: id));
  }

  void navigateToDetailStudio(String id) {
    _pushAsSingleton(DetailStudioRoutePath(id: id));
  }

  void navigateToActivityRepliesPage(String id) {
    _pushAsSingleton(ActivityRepliesRoutePath(id: id));
  }

  void navigateImagePreviewPage(PreviewSource source) {
    _pushAsSingleton(ImagePreviewRoutePath(source: source));
  }

  void navigateToMediaListUpdatePage(String mediaId, String from) {
    _pushAsSingleton(MediaListUpdateRoutePath(mediaId: mediaId, from: from));
  }

  void navigateToBirthdayCharacterPage() {
    _pushAsSingleton(const BirthdayCharacterPagePath());
  }

  void navigateToSettingsPage() {
    _pushAsSingleton(const SettingsRoutePath());
  }

  void popBackStack() {
    stack.value = [...stack.value]..removeLast();
    notifyListeners();

    final topPageOrNull = stack.value.lastOrNull;
    if (topPageOrNull != null) {
      FirebaseAnalytics.instance.logAniFlowPathChangeEvent(topPageOrNull);
    }
  }

  void _pushAsSingleton(AniFlowRoutePath path) {
    if (stack.value.contains(path)) {
      stack.value = [...stack.value]..remove(path);
    }

    stack.value = [...stack.value, path];

    notifyListeners();

    FirebaseAnalytics.instance.logAniFlowPathChangeEvent(path);
  }

  @override
  Future<void> setNewRoutePath(AniFlowRoutePath configuration) async {
    if (stack.value.isNotEmpty && configuration is AniFlowHomePath) {
      // when app launched by re-construction, the back stack is restored
      // and already having initial value.
      return;
    }

    _pushAsSingleton(configuration);
  }
}
