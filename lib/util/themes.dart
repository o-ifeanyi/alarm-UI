import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeOptions {
  Light,
  Dark,
}

final themeOptions = {
  ThemeOptions.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: Colors.white70,
    shadowColor: Colors.black12,
    cardColor: Color(0xFFDFE6F0),
    accentColor: Color(0xFFFF5071),
    scaffoldBackgroundColor: Color(0xFFF1F2F7),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  ThemeOptions.Dark: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.deepPurple,
    shadowColor: Color(0xFF24293D),
    accentColor: Color(0xFFFF5071),
    cardColor: Color(0xFF181A29),
    backgroundColor: Colors.white.withOpacity(0.07),
    scaffoldBackgroundColor: Color(0xFF39456B),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
};
