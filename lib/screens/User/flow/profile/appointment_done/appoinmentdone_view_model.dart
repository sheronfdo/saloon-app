
  import 'package:flutter/material.dart';

class BookingSuccessViewModel extends ChangeNotifier {
  String? get orderReference => null;

  

  void init() {
    //Initialization code here
  }

  void downloadReceipt() {}
}

void downloadReceipt() {   
  final String orderReference = '48892337912'; 
    print('Receipt downloaded for order: $orderReference');
  }

