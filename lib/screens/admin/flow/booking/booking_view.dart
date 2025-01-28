import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:saloon_app/components/custom/custom_calender.dart';
import 'package:saloon_app/components/search_bar.dart';
import 'package:saloon_app/screens/admin/flow/booking/booking_viewmodel.dart';
import 'package:saloon_app/screens/admin/flow/bookingConfirm/bookingConfirm_view.dart';
import 'package:saloon_app/screens/admin/flow/jobDone/jobDone_view.dart';
import 'package:saloon_app/services/admin/flow/Bookings/shedule_service.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  BookingState createState() => BookingState();
}

class BookingState extends State<BookingView> {
  DateTime _selectedDate = DateTime.now();
  final DateTime _focusedDate = DateTime.now();
  List<Map<String, dynamic>> _appointments = [];

  @override
  void initState() {
    super.initState();
    _fetchAppointmentsForSelectedDate();
  }

  Future<void> _fetchAppointmentsForSelectedDate() async {
    try {
      // String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
      final allAppointments = await ScheduleService().getAppointmentsByDate(
        day: _selectedDate.toIso8601String(),
      );
      setState(() {
        _appointments = allAppointments.map((appointment) {
          return {
            'id':appointment['appointmentId'],
            'name': appointment['customerName'] ?? 'Unknown',
            'time': appointment['timeslot'],
            'price': "\$${appointment['price']}",
            'status': appointment['status'] ?? 'NOT_CONFIRMED',
            'statusColor': appointment['status'] == 'CONFIRMED'
                ? Colors.green
                : Colors.orange,
            'imagePath': 'assets/default_avatar.png', // Default image
          };
        }).toList();
      });
    } catch (e) {
      print("Error fetching appointments: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingViewmodel(),
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
                      const SizedBox(height: 10),
                      _buildCalendar(),
                      const SizedBox(height: 20),
                      _buildScheduleList(),
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

  /// Title
  Widget _buildTitle() {
    return const Center(
      child: Text(
        'BOOKINGS',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          letterSpacing: 4.0,
        ),
      ),
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
        _fetchAppointmentsForSelectedDate();  // Fetch the appointments for the selected date
      },
    );
  }

  /// Schedule List Section
  Widget _buildScheduleList() {
    if (_appointments.isEmpty) {
      return const Center(
        child: Text("No appointments for this date."),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${DateFormat('EEEE, MMM d').format(_selectedDate)}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const SearchAppBar(),
        const SizedBox(height: 8),
        for (var appointment in _appointments)
          ScheduleCard(
            name: appointment['name'],
            time: appointment['time'],
            price: appointment['price'],
            imagePath: appointment['imagePath'],
            status: appointment['status'],
            statusColor: appointment['statusColor'],
            onTap: () {
              if (appointment['status'] == 'CONFIRMED') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        JobDoneView(appointmentId: appointment['id']),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookingConfirmView(appointmentId: appointment['id']),
                  ),
                );
              }
            },
          ),
      ],
    );
  }


}

class ScheduleCard extends StatelessWidget {
  final String name;
  final String time;
  final String price;
  final String imagePath;
  final String status;
  final Color statusColor;
  final VoidCallback onTap;

  const ScheduleCard({
    super.key,
    required this.name,
    required this.time,
    required this.price,
    required this.imagePath,
    required this.status,
    required this.statusColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the onTap callback when pressed
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 248, 255),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 150, 50, 50),
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 16, color: Colors.black54),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                if (status.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
