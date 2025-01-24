import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/CustomAppBarProfile.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_details/bokking_details_view.dart';
import 'package:saloon_app/screens/User/flow/profile/appointment_done/appointment_done_view.dart';
import 'package:saloon_app/screens/User/flow/profile/edit_profile/edit_profile_view.dart';
import 'package:saloon_app/screens/User/flow/profile/my_profile/my_profile_viewmodel.dart';
import 'package:saloon_app/screens/User/flow/profile/notification_setting/notification_setting_view.dart';
import 'package:saloon_app/screens/User/flow/profile/privacy/privacy_view.dart';
import '../../../../../themes/app_colors.dart';
import '../../../../../themes/app_styles.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  MyProfileState createState() => MyProfileState();
}

class MyProfileState extends State<MyProfileView> {
  late MyProfileViewmodel viewModel;
  bool isNotificationOn = true;

  @override
  void initState() {
    super.initState();
    viewModel = MyProfileViewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProfileViewmodel(),
      child: Scaffold(
        body: Stack(
          children: [
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
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        "MY PROFILE",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.7,
                          color: Color(0xFF524B4B),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.primaryColor,
                            child: IconButton(
                              icon: const Icon(Icons.edit,
                                  size: 15, color: Colors.white),
                              onPressed: () {
                                // Action to edit profile picture
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Alveera Ailba',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'youremail@domain.com | +01 234 567 89',
                      textAlign: TextAlign.center,
                      style: AppStyles.subheading,
                    ),
                    const SizedBox(height: 16),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Column(
                        children: [
                          _buildProfileOption(
                            icon: Icons.qr_code,
                            title: 'Edit profile information',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileView()),
                              );
                            },
                          ),
                          _buildProfileOption(
                            icon: Icons.notifications_none_outlined,
                            title: 'Notifications',
                            trailing: Text(
                              isNotificationOn ? 'ON' : 'OFF',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationSettingView()),
                              );

                              setState(() {
                                isNotificationOn = !isNotificationOn;
                              });
                            },
                          ),
                          _buildProfileOption(
                            icon: Icons.account_circle,
                            title: 'Help & Support',
                            onTap: () {},
                          ),
                          _buildProfileOption(
                            icon: Icons.format_quote,
                            title: 'Contact us',
                            onTap: () {},
                          ),
                          _buildProfileOption(
                            icon: Icons.lock,
                            title: 'Privacy policy',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PrivacyView()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(title, style: TextStyle(fontSize: 14)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
