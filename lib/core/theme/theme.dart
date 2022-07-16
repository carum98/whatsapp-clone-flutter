import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/core/theme/colors.dart';

class Theme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ThemeColorsLight.bgColor,
    primaryColor: ThemeColorsLight.fontColor,
    appBarTheme: const AppBarTheme(
      color: ThemeColorsLight.headerColor,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: ThemeColorsLight.indicatorColor,
    ),
    indicatorColor: ThemeColorsLight.indicatorColor,
    colorScheme: const ColorScheme.light(
      primaryContainer: ThemeColorsLight.bgMessageIn,
      secondaryContainer: ThemeColorsLight.bgMessageOut,
      background: ThemeColorsLight.bgConversationColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF09a784),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ThemeColorsDark.bgColor,
    primaryColor: ThemeColorsDark.fontColor,
    appBarTheme: const AppBarTheme(
      color: ThemeColorsDark.headerColor,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: ThemeColorsDark.indicatorColor,
      unselectedLabelColor: Colors.white,
    ),
    indicatorColor: ThemeColorsDark.indicatorColor,
    colorScheme: const ColorScheme.dark(
      primaryContainer: ThemeColorsDark.bgMessageIn,
      secondaryContainer: ThemeColorsDark.bgMessageOut,
      background: ThemeColorsDark.bgConversationColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF09a784),
      ),
    ),
  );
}
