import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/customappbar.dart';
import 'package:saloon_app/screens/User/flow/bookings/cancel_bokking/cancel_booking_view_model.dart';
import 'package:saloon_app/screens/User/flow/bookings/saloon_Location/saloon_location_view.dart';

class CancelBookingView extends StatefulWidget {
  const CancelBookingView({super.key});

  @override
  CancelBookingViewState createState() => CancelBookingViewState();
}

class CancelBookingViewState extends State<CancelBookingView> {
  late CancelBookingViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CancelBookingViewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: Stack(
          children: [
            // Positioned widget to place the background container
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
            // Another Positioned widget for a second background container
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
            // Positioned widget for the custom app bar
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBarWithArrow(),
            ),
            // Padding widget to add space around the content
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(top: 35.0),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cancel Booking',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Reason for cancellation',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 16),
                            CheckboxListTile(
                              title: const Text('I am unavailable at that day & time (Rejection)'),
                              value: viewModel.reason1,
                              onChanged: (value) {
                                setState(() {
                                  viewModel.reason1 = value ?? false;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('I am unavailable at that day & time (Rejection)'),
                              value: viewModel.reason2,
                              onChanged: (value) {
                                setState(() {
                                  viewModel.reason2 = value ?? false;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('I am unavailable at that day & time (Rejection)'),
                              value: viewModel.reason3,
                              onChanged: (value) {
                                setState(() {
                                  viewModel.reason3 = value ?? false;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('Other (Tell us why)'),
                              value: viewModel.reasonOther,
                              onChanged: (value) {
                                setState(() {
                                  viewModel.reasonOther = value ?? false;
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              maxLines: 4,
                              controller: viewModel.reasonController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Write your reason here...',
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFBF4011),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SaloonLocationView()));
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
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
