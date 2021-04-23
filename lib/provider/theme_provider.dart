import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._themeData);

  ThemeData _themeData;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData newTheme) {
    _themeData = newTheme;
    notifyListeners();
  }
}
