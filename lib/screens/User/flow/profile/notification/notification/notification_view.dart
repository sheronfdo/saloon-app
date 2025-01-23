import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/flow/profile/appointment_done/appointment_done_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_doing/booking_doing_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_cancelled/booking_cancelled_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_confirmed/booking_confirmed_view.dart';
import 'notification_view_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late final NotificationViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = NotificationViewModel();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    await _viewModel.fetchNotifications();
    setState(() {}); // Trigger UI update after fetching data
  }

  void _navigateToPage(BuildContext context, String title) {
    if (title == "Saloon confirmed your appointment") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingConfirmedPage()),
      );
    } else if (title == "Saloon rejected your appointment") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingCancelledView()),
      );
      
    } else if (title == "Saloon is started to doing the job") {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingDoingView()),
      );  
    } else if (title == "Successfully completed the job!") {
      
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingSuccessPage()),
      ); 
    } else {
      // Fallback for unexpected notifications
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No specific page found for: $title")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background decorations
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 240,
              height: 210,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 237, 237),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(130),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 220,
              height: 190,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 253, 212, 212),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(130),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20, width: 5),
          BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Center(
                        child: Text(
                          "NOTIFICATIONS",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.7,
                            color: Color(0xFF524B4B),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RefreshIndicator(
                      onRefresh: _fetchNotifications,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _viewModel.notifications.length,
                        itemBuilder: (context, index) {
                          final notification = _viewModel.notifications[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/salon-section.png'), // Replace with your asset
                                ),
                                title: Text(
                                  notification.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(notification.subtitle),
                                    Text(
                                      notification.timestamp,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // Navigate to the respective page
                                  _navigateToPage(context, notification.title);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
