import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ChangeLocationViewModel extends ChangeNotifier {
  // Coordinates for the location (can come from API or database)
  final LatLng location = LatLng(25.085598, 55.139360);

  void onDonePressed(BuildContext context) {
    // Handle "Done" button logic
    Navigator.pop(context);
  }
}
