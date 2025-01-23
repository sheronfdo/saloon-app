import 'package:flutter/material.dart';

class RateWorkerViewModel extends ChangeNotifier {
  int _selectedRating = 0;

  int get selectedRating => _selectedRating;

  void setRating(int rating) {
    _selectedRating = rating;
    notifyListeners();
  }

  void confirmRating() {
    // Logic to submit the rating
    debugPrint('Rating confirmed: $_selectedRating');
  }

  void reportSaloon() {
    // Logic to report saloon
    debugPrint('Saloon reported');
  }
}
