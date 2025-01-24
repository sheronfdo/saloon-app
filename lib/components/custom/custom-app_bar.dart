import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/User/flow/notifications/notification_view.dart';
import 'package:saloon_app/screens/other/adminSideMenu/adminSideMenu_view.dart';

// import '../../screens/Other/adminSideMenu/adminSideMenu_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //menu Icon
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black, size: 30),
              onPressed: () {
                //handle menu action
                print("user side menu");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminSideMenuView(),
                  ),
                );
              },
            ),

            Center(
              child: Image.asset(
                'assets/images/logo_qatar.jpeg',
                height: 50,
                fit: BoxFit.contain,
              ),
            ),

            Stack(
              children: [
                IconButton(
                  icon: const Icon(IconlyBold.notification,
                      color: Color(0xFFB3B3B3), size: 28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationView()),
                    );
                  },
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
