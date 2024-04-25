import 'dart:async';

import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/app/aniflow_router/top_level_navigation.dart';
import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart';
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AniFlowPage extends Page {
  const AniFlowPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AniFlowRoute(settings: this);
  }
}

class AniFlowRoute extends PageRoute with MaterialRouteTransitionMixin {
  AniFlowRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const AniFlowAppScaffold();
  }

  @override
  bool get maintainState => true;
}

class AniFlowAppScaffold extends StatefulWidget {
  const AniFlowAppScaffold({super.key});

  @override
  State<AniFlowAppScaffold> createState() => _AniFlowAppScaffoldState();
}

class _AniFlowAppScaffoldState extends State<AniFlowAppScaffold> {
  late AfRouterDelegate afRouterDelegate;

  var currentTopLevel = TopLevelNavigation.discover;

  bool get needHideNavigationBar => afRouterDelegate.isTopRouteFullScreen;

  late StreamSubscription _mediaTypeSub;
  late StreamSubscription _authSub;

  MediaType _mediaType = MediaType.anime;

  UserModel? userModel;

  bool get isLogIn => userModel != null;

  bool get isAnime => _mediaType == MediaType.anime;

  List<TopLevelNavigation> get _topLevelNavigationList => isLogIn
      ? [
          TopLevelNavigation.discover,
          TopLevelNavigation.track,
          TopLevelNavigation.social,
          TopLevelNavigation.profile,
        ]
      : [
          TopLevelNavigation.discover,
          TopLevelNavigation.track,
        ];

  @override
  void initState() {
    super.initState();
    afRouterDelegate = AfRouterDelegate();

    afRouterDelegate.addListener(() {
      setState(() {
        currentTopLevel = afRouterDelegate.currentTopLevelNavigation;
      });
    });

    _mediaTypeSub = getIt
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
  void dispose() {
    super.dispose();

    afRouterDelegate.dispose();
    _mediaTypeSub.cancel();
    _authSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<DiscoverBloc>(),
        ),
        BlocProvider(create: (context) => getIt.get<TrackBloc>()),
        BlocProvider(
          create: (context) => getIt.get<AuthBloc>(),
        ),
      ],
      child: Scaffold(
        body: Router(
          routerDelegate: afRouterDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
        bottomNavigationBar: VerticalScaleSwitcher(
          visible: !needHideNavigationBar,
          child: _animeTrackerNavigationBar(
            navigationList: _topLevelNavigationList,
            selected: currentTopLevel,
            onNavigateToDestination: (navigation) async {
              afRouterDelegate.backStack.navigateToTopLevelPage(navigation);
            },
          ),
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
          onNavigateToDestination(TopLevelNavigation.values[index]);
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
