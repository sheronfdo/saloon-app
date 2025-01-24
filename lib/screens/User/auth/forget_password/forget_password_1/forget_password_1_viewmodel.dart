import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_2/forget_password_2_view.dart';
import 'package:saloon_app/screens/User/auth/login/login_view.dart';
import 'package:saloon_app/screens/admin/login/admin_login_view.dart';
import 'package:saloon_app/screens/User/auth/Popup/otpPopUp/otpPopUp_view.dart';

class ForgetPassword1ViewModel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onSubmitButtonClick(BuildContext context, String userType) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OtpPopupView(userType: userType)),
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
