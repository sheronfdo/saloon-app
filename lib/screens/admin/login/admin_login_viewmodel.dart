import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_1/forget_password_1_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import 'package:saloon_app/screens/admin/flow/home/admin_home_view.dart';
import 'package:saloon_app/screens/admin/registration/admin_signup_view.dart';
import 'package:saloon_app/screens/splash/splash_4/splash_4_view.dart';


class AdminLoginViewModel extends ChangeNotifier {
  bool toggledOn = false;

  void init() {
    //Initialization code here
  }

  void onSignUpButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminSignUpView()),
    );
  }

  void onForgetPasswordClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ForgetPassword1View(userType: 'admin'),
      ),
    );
  }

  void onLogInButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminHomeView()),
    );
  }

  void onToggleClick(value) {
    toggledOn = value;
    notifyListeners();
  }

  void onBackButtonPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splash4View()),
    );
  }
}
