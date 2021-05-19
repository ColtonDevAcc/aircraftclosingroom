import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static const List validEmail = ['cbristow@aictitle.com'];
  static const Color primaryColor = Color.fromRGBO(3, 90, 166, 1.0);
  static const Color secondaryColor = Color.fromRGBO(242, 168, 29, 1.0);
  static const Color primaryAccent = Color.fromRGBO(221, 64, 64, 1.0);
  static const Color secondaryAccent = Color.fromRGBO(255, 167, 0, 1.0);
  static const Color primaryTextColor = Colors.white;
  static const Color bodyTextColor = Color.fromRGBO(166, 168, 208, 1.0);
  static const Color secondaryTextColor = Color.fromRGBO(116, 138, 157, 1.0);
  static const Color thirdAccent = Color.fromRGBO(139, 195, 217, 1.0);
  static const Color secondaryButton = Color.fromRGBO(240, 244, 248, 1.0);
  bool _darkMode = false;

  get getDarkMode => _darkMode;

  void setDarkMode(value) {
    this._darkMode = value;
    print('darkMode is now set to ${this._darkMode}');
    notifyListeners();
  }

  get getTheme => _darkMode ? ThemeData.dark() : ThemeData.light();

  bool _obscurePass = true;

  set setObscurePass(bool input) {
    if (input == true) {
      _obscurePass = true;
      notifyListeners();
    } else {
      _obscurePass = false;
      notifyListeners();
    }
  }

  get obscurePass => _obscurePass;

  bool _isValid = false;

  set setEmailInput(String input) {
    if (input == validEmail[0]) {
      _isValid = true;
      notifyListeners();
    } else {
      _isValid = false;
      notifyListeners();
    }
  }

  bool get isValid => _isValid;

  bool _isLoading = false;

  get getIsLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
