import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/components/custom/custom_calender.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_2/appoinment_2_view.dart';
import 'package:saloon_app/screens/User/flow/notifications/notification_view.dart';
import 'package:saloon_app/services/users/flow/appointment/appointment_service.dart';
import '../../../../../services/users/flow/appointment/availability_service.dart';
import 'appoinment_1_viewmodel.dart';

class Appoinment1View extends StatefulWidget {
  final String packageID;
  final String serviceId;
  final String saloonId;
  final String saloonName;
  final String packageTitle;
  final String price;

  const Appoinment1View({
    super.key,
    required this.packageID,
    required this.serviceId,
    required this.saloonId,
    required this.saloonName,
    required this.packageTitle,
    required this.price,
  });

  @override
  Appoinment1State createState() => Appoinment1State();
}

class Appoinment1State extends State<Appoinment1View> {
  DateTime _selectedDate = DateTime.now();
  final DateTime _focusedDate = DateTime.now();
  String? selectedTimeSlot;
  List<Map<String, dynamic>> _timeSlots = [];
  final AvailabilityService _availabilityService = AvailabilityService();

  @override
  void initState() {
    super.initState();
    _fetchTimeSlotsForSelectedDay();
  }

  Future<void> _fetchTimeSlotsForSelectedDay() async {
    final String dayName = _getDayName(_selectedDate);
    final String saloonId = widget.saloonId; // Corrected saloonId reference
    try {
      final slots = await _availabilityService.getAvailability(
        saloonId: saloonId,
        day: dayName,
      );
      setState(() {
        _timeSlots = slots;
      });
    } catch (error) {
      // Handle errors gracefully
      print("Error fetching time slots: $error");
      setState(() {
        _timeSlots = [];
      });
    }
  }

  String _getDayName(DateTime date) {
    return [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ][date.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AvailabilityService(),
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      _buildHeader(),
                      const SizedBox(height: 40),
                      _buildTitle(),
                      const SizedBox(height: 40),
                      _buildServiceDetails(),
                      const SizedBox(height: 8),
                      _buildCalendar(),
                      const SizedBox(height: 20),
                      _buildTimeSlots(),
                      const SizedBox(height: 20),
                      _buildConfirmButton(),
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

  /// Background Decorations
  Widget _buildBackground() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 260,
            height: 270,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 239, 239),
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
            width: 240,
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 250, 222, 222),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(130),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Header
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(IconlyBold.notification,
                  color: Color(0xFFB3B3B3), size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationView()),
                );
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Title
  Widget _buildTitle() {
    return const Center(
      child: Text(
        'APPOINTMENT',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          letterSpacing: 4.0,
        ),
      ),
    );
  }

  /// Service Details
  Widget _buildServiceDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.packageTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 5),
                Text(widget.saloonName),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${widget.price} USD',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  /// Calendar Section
  Widget _buildCalendar() {
    return CustomCalendar(
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDate,
      onDaySelected: (selectedDate) {
        setState(() {
          _selectedDate = selectedDate;
        });
        _fetchTimeSlotsForSelectedDay();
      },
    );
  }

  /// Time Slots
  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '  Choose a time slot',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        if (_timeSlots.isEmpty)
          const Center(child: Text('No slots available for the selected day.'))
        else
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: _timeSlots.map((slot) {
              final String time = slot['time']; // Assume 'time' contains the slot string
              final isSelected = selectedTimeSlot == time;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTimeSlot = time;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 218, 218, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color.fromRGBO(255, 82, 82, 1)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.black : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        const SizedBox(height: 12),
        const Text(
          '   You can re-schedule your appointment before confirmation',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 99, 99, 1),
          ),
        ),
      ],
    );
  }

  /// Confirm Button
  /// Confirm Button
  Widget _buildConfirmButton() {
    return Center(
      child: CustomButton(
        text: 'Confirm',
        onPressed: () async {
          if (selectedTimeSlot == null) {
            // Show a message if no time slot is selected
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a time slot.')),
            );
            return;
          }

          final AppointmentService appointmentService = AppointmentService();

          try {
            // Make the appointment
            await appointmentService.makeAppointment(
              saloonId: widget.saloonId,
              catId: widget.serviceId,
              packageId: widget.packageID,
              date: _selectedDate.toIso8601String(),
              timeSlot: {'time': selectedTimeSlot!},
            );

            // Navigate to Appoinment2View
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Appoinment2View(
                  packageID: widget.packageID,
                  serviceId: widget.serviceId,
                  saloonId: widget.saloonId,
                  saloonName: widget.saloonName,
                  packageTitle: widget.packageTitle,
                  price: widget.price,
                ),
              ),
            );
          } catch (error) {
            // Handle errors
            print('Error making appointment: $error');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to make an appointment.')),
            );
          }
        },
      ),
    );
  }

}
