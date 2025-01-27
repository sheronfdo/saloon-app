import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/adminProfile_card.dart';
import 'package:saloon_app/components/feature_card.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_1/appoinment_1_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_viewmodel.dart';
import 'package:saloon_app/screens/User/flow/profile/my_profile/my_profile_view.dart';
import 'package:saloon_app/screens/User/sections/banner_section.dart';
import 'package:saloon_app/screens/User/sections/schedules_section.dart';
import 'package:saloon_app/screens/admin/flow/booking/booking_view.dart';
import '../../../../components/custom/custom-app_bar.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<AdminHomeView> {
  late HomeViewModel viewModel;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
    viewModel.init();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> children = [
    const AdminHomeContentView(),
    const BookingView(),
    const MyProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class AdminHomeContentView extends StatefulWidget {
  const AdminHomeContentView({super.key});

  @override
  _AdminHomeContentViewState createState() => _AdminHomeContentViewState();
}

class _AdminHomeContentViewState extends State<AdminHomeContentView> {
  int _currentPage = 0;

  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          padding: const EdgeInsets.only(top: 2),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  const SizedBox(height: 10),
                  AdminProfileCard(),
                  const SizedBox(height: 10),
                  BannerSection(),
                  const SizedBox(height: 8),
                  const FeatureCardSection(),
                  const SizedBox(height: 8),
                  ScheduleCardSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
