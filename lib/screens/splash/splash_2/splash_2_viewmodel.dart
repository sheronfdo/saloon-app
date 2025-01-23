import 'package:flutter/material.dart';
import 'package:saloon_app/screens/splash/splash_3/splash_3_view.dart';

class Splash2Viewmodel extends ChangeNotifier {
  void init() {
    //Initialization code here
  }

  void onContinueButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splash3View()),
    );
  }

  void onSkipButtonClick(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splash3View()),
    );
  }
}
