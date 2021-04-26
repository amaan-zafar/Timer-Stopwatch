import 'package:flutter/material.dart';

enum AppThemeData { LightTheme, DarkTheme }

final appThemeData = {
  AppThemeData.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.red,
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.white,
      labelColor: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      elevation: 0,
      color: Colors.red,
    ),
  ),
  AppThemeData.LightTheme: ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.red,
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.black,
      labelColor: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      brightness: Brightness.light,
      color: Colors.red,
    ),
  )
};
