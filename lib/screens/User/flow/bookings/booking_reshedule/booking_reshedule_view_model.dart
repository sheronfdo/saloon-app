import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_reshedule/booking_reshedule_view.dart';

class RescheduleViewModel extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  final List<TimeSlot> _timeSlots = [
    TimeSlot(timeRange: "7:30 am - 8:30 am"),
    TimeSlot(timeRange: "8:30 am - 9:30 am"),
    TimeSlot(timeRange: "10:30 am - 11:30 am"),
    TimeSlot(timeRange: "12:00 pm - 1:00 pm"),
  ];

  DateTime get selectedDate => _selectedDate;

  List<TimeSlot> get timeSlots => _timeSlots;

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void selectTimeSlot(int index) {
    for (int i = 0; i < _timeSlots.length; i++) {
      _timeSlots[i].isSelected = i == index;
    }
    notifyListeners();
  }

  String get selectedTimeSlot => _timeSlots
      .firstWhere((slot) => slot.isSelected,
          orElse: () => TimeSlot(timeRange: ""))
      .timeRange;

  void reschedule() {
    // Handle reschedule logic (e.g., API call, database update)
    print("Rescheduled to $_selectedDate at $selectedTimeSlot");
  }
}
