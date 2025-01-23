import 'package:flutter/material.dart';
import 'package:saloon_app/screens/user/auth/forget_password/forget_password_1/forget_password_1_view.dart';

class ForgetPassword2ViewModel extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void init() {
    //Initialization code here
  }

  void onBackButtonPressed(BuildContext context, String userType) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ForgetPassword1View(userType: userType),
      ),
    );
  }

  void onLogInButtonClick(BuildContext context, String email, String password) {
    //add Firebase or other login logic here
    print("Email: $email, Password: $password");
  }
}
