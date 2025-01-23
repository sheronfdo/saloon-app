import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  MenuItemModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

class UsersidemenuViewmodel {
  List<MenuItemModel> getMenuItems(BuildContext context) {
    return [
      MenuItemModel(
        icon: Icons.home,
        title: 'Home',
        onTap: () {
          print('Home tapped');
          // Add navigation logic here
        },
      ),
      MenuItemModel(
        icon: Icons.bar_chart,
        title: 'Saloons',
        onTap: () {
          print('Saloons tapped');
        },
      ),
      MenuItemModel(
        icon: Icons.content_paste,
        title: 'Services',
        onTap: () {
          print('Services tapped');
        },
      ),
      MenuItemModel(
        icon: Icons.book_online,
        title: 'Bookings',
        onTap: () {
          print('Bookings tapped');
        },
      ),
      MenuItemModel(
        icon: Icons.person,
        title: 'Profile Settings',
        onTap: () {
          print('Profile Settings tapped');
        },
      ),
      MenuItemModel(
        icon: Icons.logout,
        title: 'Logout',
        onTap: () {
          print('Logout tapped');
          Navigator.pop(context);
        },
      ),
    ];
  }
}
