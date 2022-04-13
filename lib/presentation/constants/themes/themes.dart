import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.white30,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          color: Colors.black, titleTextStyle: TextStyle(color: Colors.white)));
  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.white70,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          color: Colors.white, titleTextStyle: TextStyle(color: Colors.black)));
}
