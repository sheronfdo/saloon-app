import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_calenderNew.dart';
import 'package:saloon_app/components/custom/new-custom-app-bar.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_reshedule/booking_reshedule_view_model.dart';

class BookingResheduleView extends StatefulWidget {
  const BookingResheduleView({super.key});

  @override
  BookingResheduleViewState createState() => BookingResheduleViewState();
}

class BookingResheduleViewState extends State<BookingResheduleView> {
  late RescheduleViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = RescheduleViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RescheduleViewModel>(
      create: (_) => RescheduleViewModel(),
      child: Scaffold(
        body: Stack(
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
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NewCustomAppBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.only(top: 35.0),
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
                      const SizedBox(height: 16),

                      // Top Section with Booking Details
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Text(
                              "Pro Hair Cut",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Monday, 28 Oct",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF79280A))),
                                Text(
                                  "AED 220.00",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                Text(
                                  " 8:00 am - 11:00 am",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1, color: Colors.grey),

                      // Calendar Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 250, // Adjust the height as needed
                              child: CustomCalendarNew(
                                selectedDate: viewModel.selectedDate,
                                onDateSelected: (DateTime date) {
                                  viewModel.selectDate(date);
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Choose a time slot",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio:
                                    2.5, // Adjust aspect ratio for button size
                              ),
                              itemCount: viewModel.timeSlots.length,
                              itemBuilder: (context, index) {
                                final timeSlot = viewModel.timeSlots[index];

                                return GestureDetector(
                                  onTap: () => viewModel.selectTimeSlot(index),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: timeSlot.isSelected
                                          ? Colors.red
                                          : Color(0xFFFFDADA),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        timeSlot.timeRange,
                                        style: TextStyle(
                                          color: timeSlot.isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      // Reschedule Button
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () => viewModel.reschedule(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFBF4011),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Reschedule",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlot {
  final String timeRange;
  bool isSelected;

  TimeSlot({required this.timeRange, this.isSelected = false});
}
