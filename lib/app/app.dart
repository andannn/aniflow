import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations_delegate.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/app/routing/root_router_info_parser.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/theme/colors.dart';
import 'package:aniflow/main.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late RouteInformationProvider informationProvider;
  late RootRouterDelegate rootRouterDelegate;

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

    informationProvider = PlatformRouteInformationProvider(
      initialRouteInformation: RouteInformation(
        uri: Uri.parse(
            WidgetsBinding.instance.platformDispatcher.defaultRouteName),
      ),
    );

    rootRouterDelegate = RootRouterDelegate();

    themeSub = getIt
        .get<UserDataRepository>()
        .userDataStream
        .map((event) => event.themeSetting)
        .listen((setting) {
      setState(() {
        this.setting = setting;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    themeSub.cancel();
    rootRouterDelegate.dispose();
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
            return MaterialApp.router(
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
              routerDelegate: rootRouterDelegate,
              routeInformationProvider: informationProvider,
              routeInformationParser: const RootRouterInfoParser(),
              backButtonDispatcher: rootBackButtonDispatcher,
            );
          },
        );
      },
    );
  }
}

final rootBackButtonDispatcher = RootBackButtonDispatcher();