import 'dart:async';

class Notification {
  final String title;
  final String subtitle;
  final String timestamp;

  Notification({
    required this.title,
    required this.subtitle,
    required this.timestamp,
  });
}

class NotificationViewModel {
  final List<Notification> _notifications = [
    Notification(
      title: "Saloon confirmed your appointment",
      subtitle: "Monday, 28 October",
      timestamp: "1 minute ago",
    ),
    Notification(
      title: "Saloon rejected your appointment",
      subtitle: "Reschedule your appointment",
      timestamp: "1 day ago",
    ),
    Notification(
      title: "Saloon is started to doing the job",
      subtitle: "Rate the saloon after work",
      timestamp: "12 days ago",
    ),
    Notification(
      title: "Successfully completed the job!",
      subtitle: "Rate the saloon / receipt",
      timestamp: "21 days ago",
    ),
  ];

  // Getter to expose the notifications list
  List<Notification> get notifications => _notifications;

  // Simulate data fetching
  Future<void> fetchNotifications() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    // Add your API logic here if needed
  }
}