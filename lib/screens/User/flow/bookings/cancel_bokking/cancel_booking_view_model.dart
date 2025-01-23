import 'package:flutter/material.dart';


class CancelBookingViewmodel extends ChangeNotifier {
  bool reason1 = false;
  bool reason2 = false;
  bool reason3 = false;
  bool reasonOther = false;
  TextEditingController reasonController = TextEditingController();

  void init() {
    // Initialization logic here
  }

  void submitCancellation() {
    // Submission logic here
    notifyListeners();
  }
}

