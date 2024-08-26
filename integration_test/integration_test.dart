import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/design_system/theme/colors.dart';
import 'package:aniflow/feature/detail_media/detail_media.dart';
import 'package:aniflow/feature/media_track/media_track.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  for (final theme in [ThemeMode.light, ThemeMode.dark]) {
    for (final local in AppLocalizations.supportedLocales) {
      ///
      /// Detail Media Page
      ///
      testWidgets("detail media page $local $theme",
          (WidgetTester tester) async {
        const folder = 'detail_media';
        await tester.pumpDetailMediaPage(
          locale: local,
          themeMode: theme,
        );
        await (binding, tester)
            .takeScreenshot('$folder/top/$theme', 'detail-page-$local');
      });

      testWidgets("detail media page Character $local $theme",
          (WidgetTester tester) async {
        const folder = 'detail_media';
        await tester.pumpDetailMediaPage(
          locale: local,
          themeMode: theme,
        );

        await tester.pumpAndSettle();

        final listFinder = find.byType(Scrollable).first;
        final itemFinder = find.byKey(const ValueKey('character_sector_title'));
        await tester.scrollUntilVisible(itemFinder, 500,
            scrollable: listFinder);

        await (binding, tester).takeScreenshot(
            '$folder/character-sector/$theme', 'detail-page-$local');
      });

      testWidgets("detail media page trailer $local $theme",
          (WidgetTester tester) async {
        const folder = 'detail_media';
        await tester.pumpDetailMediaPage(
          locale: local,
          themeMode: theme,
        );

        await tester.pumpAndSettle();

        final listFinder = find.byType(Scrollable).first;
        final itemFinder =
            find.byKey(const ValueKey('character_trailer_title'));
        await tester.scrollUntilVisible(itemFinder, 500,
            scrollable: listFinder);

        await (
          binding,
          tester
        ).takeScreenshot('$folder/trailer-sector/$theme', 'detail-page-$local');
      });

      ///
      /// Track Page
      ///
      testWidgets("track page $local $theme", (WidgetTester tester) async {
        const folder = 'track';
        await tester.pumpTrackPage(
          locale: local,
          themeMode: theme,
        );
        await (binding, tester)
            .takeScreenshot('$folder/top/$theme', 'track-page-$local');
      });
    }
  }
}

extension on WidgetTester {
  Future<void> pumpDetailMediaPage(
      {required Locale locale, required ThemeMode themeMode}) {
    return pumpWidget(
      _buildTestableWidget(
        child: const DetailMediaPageContent(
          mediaId: '',
        ),
        locale: locale,
        themeMode: themeMode,
      ),
    );
  }

  Future<void> pumpTrackPage(
      {required Locale locale, required ThemeMode themeMode}) {
    return pumpWidget(
      _buildTestableWidget(
        child: const MediaTrackPageContent(),
        locale: locale,
        themeMode: themeMode,
      ),
    );
  }
}

Widget _buildTestableWidget(
    {required Widget child,
    required Locale locale,
    required ThemeMode themeMode}) {
  return RootGetItScope(
    env: AfEnvironment.mock,
    child: DynamicColorBuilder(
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

      return MaterialApp(
        home: child,
        locale: locale,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
        ),
        themeMode: themeMode,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      );
    }),
  );
}

extension on (IntegrationTestWidgetsFlutterBinding, WidgetTester) {
  Future<void> takeScreenshot(String folder, String name,
      {Duration wait = const Duration(seconds: 1)}) async {
    final (binding, tester) = this;
    await binding.convertFlutterSurfaceToImage();
    try {
      await tester.pumpAndSettle(
        const Duration(milliseconds: 100),
        EnginePhase.sendSemanticsUpdate,
        wait,
      );
    } catch (_) {
      logger.e('TimeoutException $name');
    } finally {
      await binding.takeScreenshot('$folder/$name');
    }
  }
}
