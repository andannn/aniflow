import 'package:flutter/material.dart';

import 'colors.dart';

final lightThemeData = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: purple40,
      onPrimary: Colors.white,
      primaryContainer: purple90,
      onPrimaryContainer: purple10,
      secondary: orange40,
      onSecondary: Colors.white,
      secondaryContainer: orange90,
      onSecondaryContainer: orange10,
      tertiary: blue40,
      onTertiary: Colors.white,
      tertiaryContainer: blue90,
      onTertiaryContainer: blue10,
      error: red40,
      onError: Colors.white,
      errorContainer: red90,
      onErrorContainer: red10,
      background: darkPurpleGray99,
      onBackground: darkPurpleGray10,
      surface: darkPurpleGray99,
      onSurface: darkPurpleGray10,
      surfaceVariant: purpleGray90,
      onSurfaceVariant: purpleGray30,
      inverseSurface: darkPurpleGray20,
      outline: purpleGray50),
  useMaterial3: true,
  fontFamily: 'Roboto',
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(shape: const StadiumBorder())),
);

final darkThemeData = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: purple80,
      onPrimary: purple20,
      onPrimaryContainer: purple90,
      secondary: orange80,
      onSecondary: orange20,
      secondaryContainer: orange30,
      onSecondaryContainer: orange90,
      tertiary: blue80,
      onTertiary: blue20,
      tertiaryContainer: blue30,
      onTertiaryContainer: blue90,
      error: red80,
      onError: red20,
      errorContainer: red30,
      onErrorContainer: red90,
      background: darkPurpleGray10,
      onBackground: darkPurpleGray90,
      surface: darkPurpleGray10,
      onSurface: darkPurpleGray90,
      surfaceVariant: darkPurpleGray10,
      onSurfaceVariant: purpleGray80,
      outline: purpleGray60),
  useMaterial3: true,
  fontFamily: 'Roboto',
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(shape: const StadiumBorder())),
);
