import 'package:flutter/material.dart';
import 'package:saloon_app/screens/splash/splash_2/splash_2_view.dart';
import 'package:saloon_app/screens/splash/splash_3/splash_3_view.dart';

class Splash1Viewmodel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onContinueButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splash2View()),
    );
  }

  void onSkipButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splash3View()),
    );
  }
}
