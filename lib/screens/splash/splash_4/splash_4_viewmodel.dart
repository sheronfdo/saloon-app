import 'package:flutter/material.dart';
import 'package:saloon_app/screens/admin/login/admin_login_view.dart';
import 'package:saloon_app/screens/user/auth/login/login_view.dart';

class Splash4Viewmodel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onJoinAsUserButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  void onSaloonAdminButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminLoginView()),
    );
  }
}
