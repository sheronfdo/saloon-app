import 'package:flutter/material.dart';
import 'package:saloon_app/screens/admin/login/admin_login_view.dart';
import 'package:saloon_app/screens/user/auth/forget_password/forget_password_2/forget_password_2_view.dart';
import 'package:saloon_app/screens/user/auth/login/login_view.dart';

class ForgetPassword1ViewModel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onSubmitButtonClick(BuildContext context, String userType) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ForgetPassword2View(userType: userType)),
    );
  }

  void onLogInButtonClick(BuildContext context, String userType) {
    if (userType == 'customer') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminLoginView()),
      );
    }
  }

  void onBackButtonPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }
}
