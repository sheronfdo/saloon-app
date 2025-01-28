import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/components/custom/custom_calender.dart';
import 'package:saloon_app/screens/admin/flow/jobComplete/jobComplete_view.dart';
import 'package:saloon_app/screens/admin/flow/rejectedBooking/rejectBooking_view.dart';
import 'package:saloon_app/services/admin/flow/Bookings/shedule_service.dart';

class BookingRescheduleView extends StatefulWidget {
  final String appointmentId;

  const BookingRescheduleView({Key? key, required this.appointmentId}) : super(key: key);

  @override
  BookingRescheduleState createState() => BookingRescheduleState();
}

class BookingRescheduleState extends State<BookingRescheduleView> {
  DateTime _selectedDate = DateTime.now();
  final DateTime _focusedDate = DateTime.now();
  String? selectedTimeSlot;
  List<Map<String, dynamic>> _timeSlots = [];

  @override
  void initState() {
    super.initState();
    _fetchAvailability();
  }

  // Get the day name from the DateTime object
  String _getDayName(DateTime date) {
    return [
      "sunday",
      "monday",
      "tuesday",
      "wednesday",
      "thursday",
      "friday",
      "saturday"
    ][date.weekday % 7];
  }

  // Fetch availability when a new day is selected
  Future<void> _fetchAvailability() async {
    String dayName = _getDayName(_selectedDate); // Get day name (e.g., "monday")
    List<Map<String, dynamic>> timeSlots = await ScheduleService().getAvailabilityForReschedule(
      day: dayName, // Pass the day name instead of the date
    );
    setState(() {
      _timeSlots = timeSlots;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

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
                //write action code
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

  Widget _buildServiceDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  Pro Hair Cut',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '220 AED',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return CustomCalendar(
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDate,
      onDaySelected: (selectedDate) {
        setState(() {
          _selectedDate = selectedDate;
        });
        _fetchAvailability(); // Fetch availability when the date changes
      },
    );
  }

  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '  Choose a time slot',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        if (_timeSlots.isEmpty)
          const Center(child: Text('No available time slots for this date.')),
        if (_timeSlots.isNotEmpty)
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: _timeSlots.map((slot) {
              final String time = slot['start'] + " - " + slot['end'];
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
      ],
    );
  }

  Widget _buildConfirmButton() {
    return Center(
      child: CustomButton(
        text: 'Confirm',
        onPressed: () async {
          if (_selectedDate != null && selectedTimeSlot != null) {
            // Call rescheduledAppointment from ScheduleService
            await ScheduleService().rescheduledAppointment(
              appointmentId: widget.appointmentId,
              date: _selectedDate.toIso8601String(),
              timeSlot: {
                'start': selectedTimeSlot!.split(' - ')[0],
                'end': selectedTimeSlot!.split(' - ')[1],
              },
            );

            // After rescheduling, navigate to RejectBookingView
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const JobCompleteView(),
              ),
            );
          } else {
            // Optionally show a warning if the user hasn't selected a date/time slot
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select both date and time slot.')),
            );
          }
        },
      ),
    );
  }
}
