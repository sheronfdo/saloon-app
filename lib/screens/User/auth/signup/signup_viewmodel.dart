import 'package:flutter/material.dart';
import 'package:saloon_app/screens/user/auth/login/login_view.dart';

class SignUpViewModel extends ChangeNotifier {
  bool toggledOn = false;
  void init() {
    //Initialization code here
  }

  void onLogInButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  void onToggleClick(value) {
    toggledOn = value;
    notifyListeners();
  }
}
