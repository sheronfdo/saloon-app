import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  // List of notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'Alisha has booked an appointment',
      'date': 'Monday, 28 October',
      'timeAgo': '1 minute ago',
    },
    {
      'title': 'Alisha has booked an appointment',
      'date': 'Monday, 28 October',
      'timeAgo': '1 day ago',
    },
    {
      'title': 'Alisha has booked an appointment',
      'date': 'Monday, 28 October',
      'timeAgo': '12 days ago',
    },
    {
      'title': 'Alisha has booked an appointment',
      'date': 'Monday, 28 October',
      'timeAgo': '21 days ago',
    },
  ];

  // Function to fetch notifications (placeholder for API integration)
  void fetchNotifications() {
    // You can add logic here to fetch notifications from a backend
    notifyListeners();
  }
}
