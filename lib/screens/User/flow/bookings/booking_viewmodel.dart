import 'package:flutter/material.dart';

class Appointment1ViewModel extends ChangeNotifier {
  // Example list of services and time slots
  List<String> services = [
    'Haircut',
    'Facial',
    'Manicure',
    'Pedicure',
  ];

  List<String> timeSlots = [
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 1:00 PM',
    '2:00 PM - 3:00 PM',
  ];

  String? selectedService;
  String? selectedTimeSlot;

  // Method to handle service selection
  void selectService(String service) {
    selectedService = service;
    notifyListeners(); // Update the UI
  }

  // Method to handle time slot selection
  void selectTimeSlot(String timeSlot) {
    selectedTimeSlot = timeSlot;
    notifyListeners(); // Update the UI
  }

  // Method to confirm the booking
  void confirmBooking(BuildContext context) {
    if (selectedService == null || selectedTimeSlot == null) {
      // Show a message if no service or time slot is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a service and a time slot.')),
      );
    } else {
      // Here you can add logic to save the booking (e.g., save to a database or send to an API)
      // After confirming the booking, you can navigate the user to a confirmation page or show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking Confirmed!')),
      );

      // Navigate back or to another page if needed
      Navigator.pop(context);
    }
  }
}
