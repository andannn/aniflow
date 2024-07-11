import 'dart:async';

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/aniflow_home/ani_flow_router_delegate.dart';
import 'package:aniflow/feature/aniflow_home/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/discover_bloc.dart';
import 'package:aniflow/feature/aniflow_home/media_track/bloc/track_bloc.dart';
import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AniFlowHomePage extends Page {
  const AniFlowHomePage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AniFlowRoute(settings: this);
  }
}

class AniFlowRoute extends PageRoute with MaterialRouteTransitionMixin {
  AniFlowRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const RootRestorationScope(
      restorationId: 'aniflow_route',
      child: AniFlowAppScaffold(),
    );
  }

  @override
  bool get maintainState => true;
}

class AniFlowAppScaffold extends StatefulWidget {
  const AniFlowAppScaffold({super.key});

  @override
  State<AniFlowAppScaffold> createState() => _AniFlowAppScaffoldState();
}

class _AniFlowAppScaffoldState extends State<AniFlowAppScaffold>
    with RouteAware, ShowSnackBarMixin {
  AfRouterDelegate afRouterDelegate = AfRouterDelegate();
  RouteObserver rootObserver = RootRouterDelegate.get().routeObserver;

  final rootBackButtonDispatcher =
      RootRouterDelegate.get().backButtonDispatcher;
  final childBackButtonDispatcher =
      ChildBackButtonDispatcher(RootRouterDelegate.get().backButtonDispatcher);

  var currentTopLevel = TopLevelNavigation.discover;

  late StreamSubscription _mediaTypeSub;
  late StreamSubscription _authSub;

  MediaType _mediaType = MediaType.anime;

  bool _isSocialFeatureEnabled = false;

  UserModel? userModel;

  bool get isLogIn => userModel != null;

  bool get isAnime => _mediaType == MediaType.anime;

  List<TopLevelNavigation> get _topLevelNavigationList {
    if (isLogIn) {
      if (_isSocialFeatureEnabled) {
        return [
          TopLevelNavigation.discover,
          TopLevelNavigation.track,
          TopLevelNavigation.social,
          TopLevelNavigation.profile,
        ];
      } else {
        return [
          TopLevelNavigation.discover,
          TopLevelNavigation.track,
          TopLevelNavigation.profile,
        ];
      }
    } else {
      return [
        TopLevelNavigation.discover,
        TopLevelNavigation.track,
      ];
    }
  }

  @override
  void initState() {
    super.initState();

    afRouterDelegate.addListener(() {
      setState(() {
        currentTopLevel = afRouterDelegate.currentTopLevelNavigation;
      });
    });

    _mediaTypeSub = GetIt.instance
        .get<UserDataRepository>()
        .userDataStream
        .map((event) => event.mediaType)
        .distinct()
        .listen(
      (mediaType) {
        setState(() {
          _mediaType = mediaType;
        });
      },
    );

    _mediaTypeSub = GetIt.instance
        .get<UserDataRepository>()
        .isSocialFeatureEnabledStream
        .listen(
      (enabled) {
        setState(() {
          _isSocialFeatureEnabled = enabled;
        });
      },
    );

    _authSub = GetIt.instance
        .get<AuthRepository>()
        .getAuthedUserStream()
        .distinct()
        .listen((userData) {
      setState(() {
        userModel = userData;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    rootObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    super.dispose();

    rootObserver.unsubscribe(this);

    afRouterDelegate.dispose();
    _mediaTypeSub.cancel();
    _authSub.cancel();
  }

  @override
  void didPop() {
    super.didPop();
    logger.d('$runtimeType didPop');

    rootBackButtonDispatcher.takePriority();
  }

  @override
  void didPush() {
    super.didPush();
    logger.d('$runtimeType didPush');

    childBackButtonDispatcher.takePriority();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    logger.d('$runtimeType didPopNext');

    childBackButtonDispatcher.takePriority();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    logger.d('$runtimeType didPushNext');

    rootBackButtonDispatcher.takePriority();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance.get<DiscoverBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance.get<TrackBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance.get<AuthBloc>(),
        ),
      ],
      child: Scaffold(
        body: Router(
          restorationScopeId: "aniflow_home",
          routerDelegate: afRouterDelegate,
          backButtonDispatcher: childBackButtonDispatcher,
        ),
        bottomNavigationBar: _animeTrackerNavigationBar(
          navigationList: _topLevelNavigationList,
          selected: currentTopLevel,
          onNavigateToDestination: (navigation) async {
            afRouterDelegate.navigateToTopLevelPage(navigation);
          },
        ),
      ),
    );
  }

  Widget _animeTrackerNavigationBar(
      {required List<TopLevelNavigation> navigationList,
      required TopLevelNavigation selected,
      required Function(TopLevelNavigation) onNavigateToDestination}) {
    final currentIndex = TopLevelNavigation.values.indexOf(selected);
    return NavigationBar(
      destinations: navigationList
          .map(
            (navigation) => _buildNavigationBarItem(
              navigation,
              isSelected: navigation == selected,
            ),
          )
          .toList(),
      onDestinationSelected: (index) {
        if (currentIndex != index) {
          onNavigateToDestination(_topLevelNavigationList[index]);
        }
      },
      selectedIndex: currentIndex,
    );
  }

  Widget _buildNavigationBarItem(TopLevelNavigation item,
      {required bool isSelected}) {
    if (item == TopLevelNavigation.profile) {
      final profileColor = userModel?.profileColor;
      final themeData = profileColor != null
          ? Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: profileColor))
          : null;
      return themeData != null
          ? Theme(
              data: themeData,
              child: NavigationDestination(
                label: item.iconTextId,
                icon: Icon(item.unSelectedIcon),
                selectedIcon: Icon(item.selectedIcon),
              ),
            )
          : NavigationDestination(
              label: item.iconTextId,
              icon: Icon(item.unSelectedIcon),
              selectedIcon: Icon(item.selectedIcon),
            );
    } else {
      return NavigationDestination(
        label: item.iconTextId,
        icon: Icon(item.unSelectedIcon),
        selectedIcon: Icon(item.selectedIcon),
      );
    }
  }
}
