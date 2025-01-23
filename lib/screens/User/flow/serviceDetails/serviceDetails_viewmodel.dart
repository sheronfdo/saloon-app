import 'package:flutter/material.dart';

class ServiceDetailsViewModel {
  void onBookAppointmentClick(BuildContext context) {
    // Logic to handle book appointment action
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Booking Appointment...")),
    );
  }

  void onBottomNavTap(int index) {
    // Logic to handle bottom nav bar tap
    print("Navigating to index: $index");
  }
}
