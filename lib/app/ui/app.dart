import 'package:anime_tracker/app/ui/colors.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../local/anime_tracker_localizations_delegate.dart';
import '../navigation/nia_router.dart';
import '../navigation/top_level_navigation.dart';

class AnimeTrackerApp extends StatefulWidget {
  const AnimeTrackerApp({super.key});

  @override
  State<StatefulWidget> createState() => AnimeTrackerAppState();
}

class AnimeTrackerAppState extends State<AnimeTrackerApp> {
  @override
  void initState() {
    super.initState();
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
            // extensions: [lightCustomColors],
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            // extensions: [darkCustomColors],
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
  State<AnimeTrackerAppScaffold> createState() => _AnimeTrackerAppScaffoldState();
}

class _AnimeTrackerAppScaffoldState extends State<AnimeTrackerAppScaffold> {
  final animeTrackerRouterDelegate = AnimeTrackerRouterDelegate();

  var currentNavigation = TopLevelNavigation.home;
  var needShowAppbar = true;

  @override
  void initState() {
    super.initState();

    animeTrackerRouterDelegate.addListener(() {
      setState(() {
        currentNavigation = animeTrackerRouterDelegate.currentTopLevelNavigation;
        needShowAppbar = animeTrackerRouterDelegate.needShowTopAppBar;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    animeTrackerRouterDelegate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: needShowAppbar ? _animeTrackerAppBar(navigation: currentNavigation) : null,
      body: Router(routerDelegate: animeTrackerRouterDelegate, backButtonDispatcher: RootBackButtonDispatcher()),
      bottomNavigationBar: _animeTrackerNavigationBar(
          selected: currentNavigation,
          onNavigateToDestination: (navigation) async {
            animeTrackerRouterDelegate.navigateToTopLevelPage(navigation);
          }),
    );
  }

  PreferredSizeWidget _animeTrackerAppBar({
    required TopLevelNavigation navigation,
    VoidCallback? onSettingClick,
    VoidCallback? onSearchClick,
  }) =>
      AppBar(
        leading: IconButton(onPressed: onSearchClick, icon: const Icon(Icons.search)),
        title: Align(alignment: Alignment.center, child: Text(navigation.titleTextId)),
        actions: [IconButton(onPressed: onSettingClick, icon: const Icon(Icons.settings))],
      );

  Widget? _animeTrackerNavigationBar(
      {required TopLevelNavigation selected, required Function(TopLevelNavigation) onNavigateToDestination}) {
    final currentIndex = TopLevelNavigation.values.indexOf(selected);
    return NavigationBar(
      destinations: TopLevelNavigation.values
          .map((navigation) => navigation.toBottomNavigationBarItem(isSelected: navigation == selected))
          .toList(),
      onDestinationSelected: (index) {
        if (currentIndex != index) {
          onNavigateToDestination(TopLevelNavigation.values[index]);
        }
      },
      selectedIndex: currentIndex,
    );
  }
}
