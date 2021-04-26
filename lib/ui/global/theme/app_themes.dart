import 'package:flutter/material.dart';

enum AppThemeData { LightTheme, DarkTheme }

final appThemeData = {
  AppThemeData.LightTheme: ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.red,
  ),
  AppThemeData.DarkTheme: ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.red,
      canvasColor: Colors.grey)
};
