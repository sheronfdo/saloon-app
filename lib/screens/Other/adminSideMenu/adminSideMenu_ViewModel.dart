import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/admin/flow/availability/changeAvailability/changeAvailability_view.dart';
import 'package:saloon_app/screens/admin/flow/changeLocation/changeLocation_view.dart';
import 'package:saloon_app/screens/admin/flow/home/admin_home_view.dart';
import 'package:saloon_app/screens/admin/flow/service/addNewPackage/addNewPackage_view.dart';
import 'package:saloon_app/screens/admin/flow/service/category/category_view.dart';
import 'package:saloon_app/screens/splash/splash_4/splash_4_view.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminHomeView()),
          );
        },
      ),
      MenuItemModel(
        icon: IconlyLight.shield_done,
        title: 'Availability',
        onTap: () {
          print('Saloons Availability');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChangeavailabilityView()),
          );
        },
      ),
      MenuItemModel(
        icon: IconlyLight.location,
        title: 'Your Location',
        onTap: () {
          print('Services Location');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChangeLocationView()),
          );
        },
      ),
      MenuItemModel(
        icon: IconlyLight.document,
        title: 'My Services',
        onTap: () {
          print('My Services');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ServiceCategoryView()),
          );
        },
      ),
      MenuItemModel(
        icon: IconlyLight.profile,
        title: 'Profile Settings',
        onTap: () {
          print('Profile Settings tapped');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ),
          // );
        },
      ),
      MenuItemModel(
        icon: Icons.logout,
        title: 'Logout',
        onTap: () {
          print('Logout tapped');
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Splash4View()),
          );
        },
      ),
    ];
  }
}
