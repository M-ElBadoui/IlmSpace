import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,

}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[900],
//    canvasColor: Colors.green
  ),
};