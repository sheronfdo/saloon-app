import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/CustomAppBarProfile.dart';
import 'package:saloon_app/components/profile_card.dart';
import 'package:saloon_app/screens/User/flow/bookings/bookings/booking_header_view.dart';
import 'package:saloon_app/screens/User/sections/allsaloo_section.dart';
import 'package:saloon_app/screens/user/flow/home/home_viewmodel.dart';
import '../../sections/banner_section.dart';
import '../../sections/category_section.dart';
import '../../sections/salon_section.dart';
import '../profile/my_profile/my_profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeView> {
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
    const HomeContentView(),
    const BookingheaderView(),
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

class HomeContentView extends StatefulWidget {
  const HomeContentView({super.key});

  @override
  _HomeContentViewState createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<HomeContentView> {
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
          padding: const EdgeInsets.only(top: 1),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBarProfile(),
                  const SizedBox(height: 10),
                  ProfileCard(),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: BannerSection(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CategorySection(),
                  const SizedBox(height: 20),
                  const SalonSection(),
                  const SizedBox(height: 20),
                  const AllSalonSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
