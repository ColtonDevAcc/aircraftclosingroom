//notify home model on change
import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  //password is visable ?? the user must set this as activated by clicking the visable icon
  bool _obscurePass = false;

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
    if (input == ThemeProvider.validEmail[0]) {
      _isValid = true;
      notifyListeners();
    } else {
      _isValid = false;
      notifyListeners();
    }
  }

  bool get isValid => _isValid;
}
