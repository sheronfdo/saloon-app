import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_viewmodel.dart';

class Appointment1View extends StatelessWidget {
  const Appointment1View({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the ViewModel from ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (_) => Appointment1ViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Appointment'),
          backgroundColor: Colors.pink,
        ),
        body: Consumer<Appointment1ViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display available services (example list)
                  const Text(
                    'Select a Service',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.services.length,
                    itemBuilder: (context, index) {
                      final service = viewModel.services[index];
                      return ListTile(
                        title: Text(service),
                        onTap: () => viewModel.selectService(service),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Display available time slots
                  const Text(
                    'Select a Time Slot',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.timeSlots.length,
                    itemBuilder: (context, index) {
                      final timeSlot = viewModel.timeSlots[index];
                      return ListTile(
                        title: Text(timeSlot),
                        onTap: () => viewModel.selectTimeSlot(timeSlot),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Confirm Booking button
                  ElevatedButton(
                    onPressed: () => viewModel.confirmBooking(context),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: const Text('Confirm Booking'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
