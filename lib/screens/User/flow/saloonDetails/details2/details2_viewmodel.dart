import 'package:flutter/material.dart';

class Details2ViewModel extends ChangeNotifier {
  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void onBottomNavTap(int index) {
    //add here logic
  }
}
