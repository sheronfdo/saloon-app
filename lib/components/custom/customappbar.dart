import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/User/flow/profile/notification/notification/notification_view.dart';
import 'package:saloon_app/themes/app_colors.dart';

class CustomAppBarWithArrow extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.darkGray),
              onPressed: () {
                Navigator.pop(context);
              },
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
