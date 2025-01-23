import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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

class AdminSideMenuViewModel {
  List<MenuItemModel> getMenuItems(BuildContext context) {
    return [
      MenuItemModel(
        icon: IconlyLight.home,
        title: 'Home',
        onTap: () {
          print('Home tapped');
          // Add navigation logic here
        },
      ),
      MenuItemModel(
        icon: IconlyLight.shield_done,
        title: 'Availability',
        onTap: () {
          print('Saloons Availability');
        },
      ),
      MenuItemModel(
        icon: IconlyLight.location,
        title: 'Your Location',
        onTap: () {
          print('Services Location');
        },
      ),
      MenuItemModel(
        icon: IconlyLight.document,
        title: 'My Services',
        onTap: () {
          print('My Services');
        },
      ),
      MenuItemModel(
        icon: IconlyLight.profile,
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
