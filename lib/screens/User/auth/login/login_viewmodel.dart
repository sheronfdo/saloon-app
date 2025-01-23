import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_1/forget_password_1_view.dart';
import 'package:saloon_app/screens/User/auth/signup/signup_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import 'package:saloon_app/screens/splash/splash_4/splash_4_view.dart';
import 'package:saloon_app/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool toggledOn = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleRememberMe(bool value) {
    toggledOn = value;
    notifyListeners();
  }

  void init() {
    //Initialization code here
  }

  void onSignUpButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUpView()),
    );
  }

  void onLogInButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }

  void onForgetPasswordClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ForgetPassword1View(userType: 'customer'),
      ),
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
