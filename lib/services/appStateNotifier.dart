import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStateNotifier extends ChangeNotifier {
  bool _darkModeEnabled = false;
  bool get getDarkModeEnabled => _darkModeEnabled;

  ThemeData _theme = ThemeData.light();
  ThemeData get getTheme => _theme;

  void setDarkModeIsEnabled(bool isDarkModeEnabled) {
    if (isDarkModeEnabled == true) {
      _theme = ThemeData.dark();
      notifyListeners();
      print('dark');
    } else {
      _theme = ThemeData.light();
      notifyListeners();
      print('light');
    }
    _darkModeEnabled = isDarkModeEnabled;
    notifyListeners();
  }
}
