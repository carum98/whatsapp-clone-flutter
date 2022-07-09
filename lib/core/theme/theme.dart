import 'package:flutter/material.dart' show ThemeData, Brightness, AppBarTheme, TabBarTheme, Colors;
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
  );
}
