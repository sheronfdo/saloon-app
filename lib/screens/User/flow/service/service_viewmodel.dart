import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/signup/signup_view.dart';

class ServiceViewModel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onSignUpButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUpView()),
    );
  }
}
