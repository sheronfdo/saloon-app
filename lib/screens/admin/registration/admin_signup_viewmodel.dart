import 'package:flutter/material.dart';
import 'package:saloon_app/screens/admin/login/admin_login_view.dart';

class AdminSignUpViewModel extends ChangeNotifier {
  late PageController pageController;
  bool isCheckBoxChecked = false;

  void init(PageController controller) {
    pageController = controller;
  }

  void onLogInButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminLoginView()),
    );
  }

  void onBackButtonPressed(BuildContext context) {
    if (pageController.page! > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void onUploadImagePressed() {
    // Logic for image picker
  }

  void onCheckBoxClick(bool? value) {
    isCheckBoxChecked = value!;
    notifyListeners();
  }
}
