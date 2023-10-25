import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations_delegate.dart';
import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/app/navigation/top_level_navigation.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/theme/colors.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart';
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// context of app root.
BuildContext? globalContext;

class AnimeTrackerApp extends StatefulWidget {
  const AnimeTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() => AnimeTrackerAppState();
}

class AnimeTrackerAppState extends State<AnimeTrackerApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
  var showFloatingButton = true;
  late UserDataRepository userDataRepository = UserDataRepositoryImpl();
  late StreamSubscription _mediaTypeSub;
  MediaType _mediaType = MediaType.anime;

  bool get isAnime => _mediaType == MediaType.anime;

  @override
  void initState() {
    super.initState();
    animeTrackerRouterDelegate.addListener(() {
      setState(() {
        currentNavigation =
            animeTrackerRouterDelegate.currentTopLevelNavigation;
        needHideNavigationBar = animeTrackerRouterDelegate.isTopRouteFullScreen;
        showFloatingButton = animeTrackerRouterDelegate.showFloatingButton;
      });
    });
    _mediaTypeSub = userDataRepository.getMediaTypeStream().distinct().listen(
          (mediaType) {
        setState(() {
          _mediaType = mediaType;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    animeTrackerRouterDelegate.dispose();
    _mediaTypeSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DiscoverBloc(
                userDataRepository: context.read<UserDataRepository>(),
                aniListRepository: context.read<MediaInformationRepository>(),
                authRepository: context.read<AuthRepository>(),
                animeTrackListRepository: context.read<MediaListRepository>(),
              ),
        ),
        BlocProvider(
          create: (context) =>
              TrackBloc(
                userDataRepository: context.read<UserDataRepository>(),
                mediaListRepository: context.read<MediaListRepository>(),
                authRepository: context.read<AuthRepository>(),
              ),
        ),
      ],
      child: Scaffold(
        body: Router(
            routerDelegate: animeTrackerRouterDelegate,
            backButtonDispatcher: RootBackButtonDispatcher()),
        floatingActionButton: showFloatingButton
            ? _buildTopFloatingActionButton()
            : null,
        bottomNavigationBar: VerticalScaleSwitcher(
          visible: !needHideNavigationBar,
          child: _animeTrackerNavigationBar(
            selected: currentNavigation,
            onNavigateToDestination: (navigation) async {
              animeTrackerRouterDelegate.navigateToTopLevelPage(navigation);
            },
          ),
        ),
      ),
    );
  }

  Widget _animeTrackerNavigationBar({required TopLevelNavigation selected,
    required Function(TopLevelNavigation) onNavigateToDestination}) {
    final currentIndex = TopLevelNavigation.values.indexOf(selected);
    return NavigationBar(
      destinations: TopLevelNavigation.values
          .map((navigation) =>
          navigation.toBottomNavigationBarItem(
              isSelected: navigation == selected))
          .toList(),
      onDestinationSelected: (index) {
        if (currentIndex != index) {
          onNavigateToDestination(TopLevelNavigation.values[index]);
        }
      },
      selectedIndex: currentIndex,
    );
  }

  Widget _buildTopFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        final repository = context.read<UserDataRepository>();
        if (_mediaType == MediaType.manga) {
          repository.setMediaType(MediaType.anime);
        } else {
          repository.setMediaType(MediaType.manga);
        }
      },
      isExtended: true,
      icon: isAnime
          ? const Icon(Icons.palette_rounded)
          : const Icon(Icons.map),
      label: Text(isAnime ? 'Anime' : 'Manga'),
    );
  }
}
