import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/profile/appointment_done/appointment_done_view.dart';
import 'package:saloon_app/screens/User/flow/profile/notification_setting/notification_setting_viewmodel.dart';
import '../../../../../components/custom/new-custom-app-bar.dart';
import '../../../../../themes/app_colors.dart';
import '../../../../../themes/app_styles.dart';

class NotificationSettingView extends StatefulWidget {
  const NotificationSettingView({super.key});

  @override
  NotificationSettingState createState() => NotificationSettingState();
}

class NotificationSettingState extends State<NotificationSettingView> {
  late NotificationSettingViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = NotificationSettingViewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationSettingViewmodel(),
      child: Scaffold(
        body: Stack(
          children: [
            // Background Decorations
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
            // Custom App Bar
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:
                  NewCustomAppBar(), // Ensure the custom app bar widget is defined
            ),
            // Main Content
            Padding(
              padding:
                  const EdgeInsets.only(top: 60), // Space below the app bar
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // Centered Page Title
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
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
                      const SizedBox(height: 20),
                      // Common Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Common',
                            style: AppStyles.mainHeading.copyWith(fontSize: 16),
                            textAlign: TextAlign.start, // Align to the start
                          ),
                          SwitchListTile(
                            title: const Text('General Notifications',
                                style: AppStyles.fieldName),
                            activeColor: AppColors.primaryColor,
                            value: true,
                            onChanged: (value) {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BookingSuccessPage()),
                                );
                            },
                          ),
                          SwitchListTile(
                            title:
                                const Text('Sound', style: AppStyles.fieldName),
                            activeColor: AppColors.primaryColor,
                            value: false,
                            onChanged: (value) {
                              // Add logic for Sound toggle
                            },
                          ),
                          SwitchListTile(
                            title: const Text('Vibrate',
                                style: AppStyles.fieldName),
                            activeColor: AppColors.primaryColor,
                            value: false,
                            onChanged: (value) {
                              // Add logic for Vibrate toggle
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // System & Services Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'System & Services',
                            style: AppStyles.mainHeading.copyWith(fontSize: 16),
                            textAlign: TextAlign.start, // Align to the start
                          ),
                          SwitchListTile(
                            title: const Text('App updates',
                                style: AppStyles.fieldName),
                            activeColor: AppColors.primaryColor,
                            value: true,
                            onChanged: (value) {
                              // Add logic for App updates toggle
                            },
                          ),
                          SwitchListTile(
                            title: const Text('Reminder',
                                style: AppStyles.fieldName),
                            activeColor: AppColors.primaryColor,
                            value: true,
                            onChanged: (value) {
                              // Add logic for Reminder toggle
                            },
                          ),
                          SwitchListTile(
                            title: const Text('Promotion',
                                style: AppStyles.fieldName),
                            activeColor: AppColors.primaryColor,
                            value: false,
                            onChanged: (value) {
                              // Add logic for Promotion toggle
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
