import 'package:delivery/Themes/dark_mode.dart';
import 'package:delivery/Themes/light_mode.dart';
import 'package:flutter/material.dart';
class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
  void ToggleTheme() {
   if (_themeData == lightMode) {
     themeData = darkMode;
   }
   else   {
    themeData = lightMode;
   }
  }
}