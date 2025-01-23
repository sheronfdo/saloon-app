import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Widget _buildDrawerOption({
    required IconData icon,
    required String title,
    required VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 240, 192, 192),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: DrawerHeader(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop(); // Closes the drawer
                        },
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Alveera Ailba',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 131, 129, 129),
                          ),
                        ),
                        Text(
                          'Pro Member',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Active',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDrawerOption(
                        icon: Icons.home, title: 'Home', onTap: () {}),
                    _buildDrawerOption(
                        icon: Icons.business, title: 'Saloons', onTap: () {}),
                    _buildDrawerOption(
                        icon: Icons.design_services,
                        title: 'Services',
                        onTap: () {}),
                    _buildDrawerOption(
                        icon: Icons.calendar_today,
                        title: 'Bookings',
                        onTap: () {}),
                    _buildDrawerOption(
                        icon: Icons.settings,
                        title: 'Profile Settings',
                        onTap: () {}),
                    _buildDrawerOption(
                        icon: Icons.logout, title: 'Logout', onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
