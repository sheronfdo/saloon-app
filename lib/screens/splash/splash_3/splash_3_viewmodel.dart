import 'package:flutter/material.dart';
import 'package:saloon_app/screens/splash/splash_4/splash_4_view.dart';

class Splash3Viewmodel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onGetStartedButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splash4View()),
    );
  }
}
