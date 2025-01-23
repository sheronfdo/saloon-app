import 'package:flutter/material.dart';
import 'package:saloon_app/components/custom/CustomAppBarProfile.dart';
import 'package:saloon_app/screens/User/flow/bookings/bookings/booking_history.dart';
import 'package:saloon_app/screens/User/flow/bookings/bookings/booking_upcoming.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import 'package:saloon_app/screens/User/flow/profile/my_profile/my_profile_view.dart';
import 'package:saloon_app/themes/app_colors.dart';
import 'package:saloon_app/themes/app_styles.dart';


class BookingheaderView extends StatefulWidget {
  const BookingheaderView({super.key});

  @override
  State<BookingheaderView> createState() => _BookingheaderViewState();
}

class _BookingheaderViewState extends State<BookingheaderView> {
  bool isHistorySelected = true;
  bool isUpcommingSelected = false;

  // Track the current index for bottom navigation
  
    void onTabTapped(int index) {
    setState(() {
    });
  }

  final List<Widget> children = [
    const HomeContentView(),
    const BookingheaderView(),
    const MyProfileView(),
  ];


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
            padding: const EdgeInsets.only(top: 60), // Space below the app bar

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,),
                child: Expanded(
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
                      // Tab bar for "Upcoming" and "History"
                      Stack(
                        children: [
                          // Pointer (Curve with Dot)
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            top: 40,
                            left: isHistorySelected
                                ? MediaQuery.of(context).size.width * 0.75 - 75
                                : MediaQuery.of(context).size.width * 0.25 - 70,
                            child: CustomPaint(
                              size: const Size(70, 50),
                              painter: PointerPainter(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 36.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isHistorySelected = false;
                                      isUpcommingSelected = true;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 36, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: isUpcommingSelected
                                          ? AppColors.secondaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Upcoming",
                                      style: AppStyles.buttonText.copyWith(
                                        color: isUpcommingSelected
                                            ? Colors.white
                                            : AppColors.darkOneGray,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isHistorySelected = true;
                                      isUpcommingSelected = false;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 36, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: isHistorySelected
                                          ? AppColors.secondaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "History",
                                      style: AppStyles.buttonText.copyWith(
                                        color: isHistorySelected
                                            ? Colors.white
                                            : AppColors.darkOneGray,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      // Conditionally render BookingHistory
                      if (isHistorySelected) const BookingHistory(),
                       if (isUpcommingSelected) const BookingUpcoming(),
                      // Conditionally render BookingUpcoming (if you have this widget)
                    ],
                  ),
                ),
              ),
            
          ),
        ],
      ),
      
    );
  }
}

// Pointer Painter with Dot and Curve
class PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFB0A8F0) // Updated color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height); // Bottom left curve start
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 10, size.width * 0.8, size.height); // Curve to bottom right
    path.lineTo(size.width * 0.5, 0); // Peak of triangle
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
