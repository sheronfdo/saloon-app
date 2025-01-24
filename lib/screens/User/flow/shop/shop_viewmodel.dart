import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/flow/notifications/notification_view.dart';
import 'package:saloon_app/screens/user/auth/signup/signup_view.dart';

class ShopViewModel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onSignUpButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUpView()),
    );
  }

  void onNotificationClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationView()),
    );
  }

  void onSideMenuClick(BuildContext context) {}
}
