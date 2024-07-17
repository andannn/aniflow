import 'package:aniflow/app/app_bloc.dart';
import 'package:aniflow/app/app_state.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/app/routing/root_router_info_parser.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/design_system/theme/colors.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AniFlowApp extends StatelessWidget {
  const AniFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      final theme = state.theme;
      return DynamicColorApp(themeSetting: theme);
    });
  }
}

class DynamicColorApp extends StatefulWidget {
  const DynamicColorApp({super.key, required this.themeSetting});

  final ThemeSetting themeSetting;

  @override
  State<DynamicColorApp> createState() => _DynamicColorAppState();
}

class _DynamicColorAppState extends State<DynamicColorApp> {
  final routerDelegate = RootRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        lightColorScheme = ColorScheme.fromSeed(
          seedColor: lightDynamic?.primary ?? brandColor,
        );
        darkColorScheme = ColorScheme.fromSeed(
          seedColor: darkDynamic?.primary ?? brandColor,
          brightness: Brightness.dark,
        );
        return MaterialApp.router(
          restorationScopeId: "root",
          themeMode: _getThemeMode(widget.themeSetting),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: routerDelegate,
          routeInformationProvider: PlatformRouteInformationProvider(
            initialRouteInformation: RouteInformation(
              uri: Uri.parse(
                  WidgetsBinding.instance.platformDispatcher.defaultRouteName),
            ),
          ),
          routeInformationParser: const RootRouterInfoParser(),
          backButtonDispatcher: routerDelegate.backButtonDispatcher,
        );
      },
    );
  }

  ThemeMode _getThemeMode(ThemeSetting setting) => switch (setting) {
        ThemeSetting.dark => ThemeMode.dark,
        ThemeSetting.light => ThemeMode.light,
        ThemeSetting.system => ThemeMode.system,
      };
}
