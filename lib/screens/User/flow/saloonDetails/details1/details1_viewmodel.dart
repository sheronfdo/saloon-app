import 'package:flutter/material.dart';

class Details1ViewModel extends ChangeNotifier {
  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void onBottomNavTap(int index) {
    //add this logic
  }
}
