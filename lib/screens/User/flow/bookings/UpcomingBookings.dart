import 'package:flutter/material.dart';
import 'package:saloon_app/components/custom/custom_app_bar_profile.dart';

import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/themes/app_colors.dart';
import 'package:saloon_app/themes/app_styles.dart';

class Bookingheader extends StatefulWidget {
  const Bookingheader({super.key});

  @override
  State<Bookingheader> createState() => _BookingheaderState();
}

class _BookingheaderState extends State<Bookingheader>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample data for Upcoming and History bookings
  final List<Map<String, String>> upcomingBookings = [
    {
      "title": "Pro Hair Cut",
      "date": "Monday, 28 Oct",
      "time": "8:00 a.m. - 11:00 a.m.",
      "price": "AED 250",
    },
    {
      "title": "Beard Trim",
      "date": "Tuesday, 29 Oct",
      "time": "10:00 a.m. - 12:00 p.m.",
      "price": "AED 150",
    },
  ];

  final List<Map<String, String>> historyBookings = [
    {
      "title": "Facial Cleanup",
      "date": "Friday, 20 Oct",
      "time": "2:00 p.m. - 3:00 p.m.",
      "price": "AED 300",
    },
    {
      "title": "Hair Spa",
      "date": "Thursday, 19 Oct",
      "time": "1:00 p.m. - 2:00 p.m.",
      "price": "AED 400",
    },
  ];

  // Bottom navigation current index
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Navigation logic can be added here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Decorations
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
          // Custom App Bar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBarProfile(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Text(
                      "BOOKINGS",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.7,
                        color: Color(0xFF524B4B),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Tab Bar
                TabBar(
                  controller: _tabController,
                  indicatorColor: AppColors.secondaryColor,
                  labelColor: AppColors.secondaryColor,
                  unselectedLabelColor: AppColors.darkOneGray,
                  labelStyle: AppStyles.buttonText,
                  tabs: const [
                    Tab(text: "Upcoming"),
                    Tab(text: "History"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Upcoming Tab
                      ListView.builder(
                        itemCount: upcomingBookings.length,
                        itemBuilder: (context, index) {
                          final booking = upcomingBookings[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Text(
                                booking["title"] ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${booking["date"]}\n${booking["time"]}",
                                style: const TextStyle(height: 1.5),
                              ),
                              trailing: Text(
                                booking["price"] ?? "",
                                style: const TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          );
                        },
                      ),
                      // History Tab
                      ListView.builder(
                        itemCount: historyBookings.length,
                        itemBuilder: (context, index) {
                          final booking = historyBookings[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Text(
                                booking["title"] ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${booking["date"]}\n${booking["time"]}",
                                style: const TextStyle(height: 1.5),
                              ),
                              trailing: Text(
                                booking["price"] ?? "",
                                style: const TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
