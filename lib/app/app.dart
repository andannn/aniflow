import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations_delegate.dart';
import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/app/navigation/top_level_navigation.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/theme_setting.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/core/design_system/theme/colors.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart';
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// context of app root.
BuildContext? globalContext;

class AniFlowApp extends StatefulWidget {
  const AniFlowApp({super.key});

  @override
  State<StatefulWidget> createState() => AniFlowAppState();

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<AniFlowAppState>()?.restartApp();
  }
}

class AniFlowAppState extends State<AniFlowApp> {
  var key = UniqueKey();
  var setting = ThemeSetting.system;
  late StreamSubscription themeSub;

  ThemeMode get themeMode => switch (setting) {
        ThemeSetting.dark => ThemeMode.dark,
        ThemeSetting.light => ThemeMode.light,
        ThemeSetting.system => ThemeMode.system,
      };

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));

    themeSub = AniFlowPreferences().getThemeSettingStream().listen((setting) {
      setState(() {
        this.setting = setting;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    themeSub.cancel();
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      key: key,
      builder: (context) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme lightColorScheme;
            ColorScheme darkColorScheme;

            if (lightDynamic != null && darkDynamic != null) {
              lightColorScheme = lightDynamic.harmonized();
              darkColorScheme = darkDynamic.harmonized();
            } else {
              // Otherwise, use fallback schemes.
              lightColorScheme = ColorScheme.fromSeed(
                seedColor: brandColor,
              );
              darkColorScheme = ColorScheme.fromSeed(
                seedColor: brandColor,
                brightness: Brightness.dark,
              );
            }
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeMode,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightColorScheme,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
              ),
              localizationsDelegates: [
                AnimeTrackerLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('es'),
                Locale('zh'),
                Locale('Jpan'),
                Locale('ja'),
              ],
              home: const AnimeTrackerAppScaffold(),
            );
          },
        );
      },
    );
  }
}

class AnimeTrackerAppScaffold extends StatefulWidget {
  const AnimeTrackerAppScaffold({super.key});

  @override
  State<AnimeTrackerAppScaffold> createState() =>
      _AnimeTrackerAppScaffoldState();
}

class _AnimeTrackerAppScaffoldState extends State<AnimeTrackerAppScaffold> {
  final animeTrackerRouterDelegate = AFRouterDelegate();

  var currentNavigation = TopLevelNavigation.discover;
  var needHideNavigationBar = false;
  final userDataRepository = SettingsRepositoryImpl();
  final authRepository = AuthRepositoryImpl();
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
    animeTrackerRouterDelegate.addListener(() {
      setState(() {
        currentNavigation =
            animeTrackerRouterDelegate.currentTopLevelNavigation;
        needHideNavigationBar = animeTrackerRouterDelegate.isTopRouteFullScreen;
      });
    });
    _mediaTypeSub = userDataRepository.getMediaTypeStream().distinct().listen(
      (mediaType) {
        setState(() {
          _mediaType = mediaType;
        });
      },
    );
    _authSub =
        authRepository.getAuthedUserStream().distinct().listen((userData) {
      setState(() {
        userModel = userData;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    animeTrackerRouterDelegate.dispose();
    _mediaTypeSub.cancel();
    _authSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DiscoverBloc(
            settingsRepository: context.read<SettingsRepository>(),
            mediaRepository: context.read<MediaInformationRepository>(),
            authRepository: context.read<AuthRepository>(),
            animeTrackListRepository: context.read<MediaListRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => TrackBloc(
            settingsRepository: context.read<SettingsRepository>(),
            mediaListRepository: context.read<MediaListRepository>(),
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
      ],
      child: Scaffold(
        body: Router(
          routerDelegate: animeTrackerRouterDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
        bottomNavigationBar: VerticalScaleSwitcher(
          visible: !needHideNavigationBar,
          child: _animeTrackerNavigationBar(
            navigationList: _topLevelNavigationList,
            selected: currentNavigation,
            onNavigateToDestination: (navigation) async {
              animeTrackerRouterDelegate.navigateToTopLevelPage(navigation);
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
