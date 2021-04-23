import 'package:aircraftclosingroom/core/global.dart';
import 'package:flutter/cupertino.dart';

//notify home model on change
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
    if (input == Global.validEmail[0]) {
      _isValid = true;
      notifyListeners();
    } else {
      _isValid = false;
      notifyListeners();
    }
  }

  bool get isValid => _isValid;
}
