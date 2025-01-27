import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/flow/bookings/bookings/booking_header_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import 'package:saloon_app/screens/User/flow/profile/my_profile/my_profile_view.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details1/details1_view.dart';
import 'package:saloon_app/screens/User/flow/service/service_view.dart';
import 'package:saloon_app/screens/splash/splash_4/splash_4_view.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final void Function() onTap;

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        },
      ),
      MenuItemModel(
        icon: Icons.bar_chart,
        title: 'Saloons',
        onTap: () {
          print('Saloons tapped');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const Details1view()),
          // );
        },
      ),
      MenuItemModel(
        icon: Icons.content_paste,
        title: 'Services',
        onTap: () {
          print('Services tapped');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ServiceView()),
          );
        },
      ),
      MenuItemModel(
        icon: Icons.book_online,
        title: 'Bookings',
        onTap: () {
          print('Bookings tapped');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookingheaderView()),
          );
        },
      ),
      MenuItemModel(
        icon: Icons.person,
        title: 'Profile Settings',
        onTap: () {
          print('Profile Settings tapped');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyProfileView()),
          );
        },
      ),
      MenuItemModel(
        icon: Icons.logout,
        title: 'Logout',
        onTap: () {
          print('Logout tapped');
          //Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Splash4View()),
          );
        },
      ),
    ];
  }
}
