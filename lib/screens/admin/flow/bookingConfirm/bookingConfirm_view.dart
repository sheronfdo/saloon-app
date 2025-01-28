import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_reshedule/booking_reshedule_view.dart';
import 'package:saloon_app/screens/admin/flow/bookingReschedule/reschedule_02/reschedule02_view.dart';
import 'package:saloon_app/screens/admin/flow/bookingReschedule/reschedule_view.dart';
import 'package:saloon_app/screens/admin/flow/jobComplete/jobComplete_view.dart';
import 'package:saloon_app/screens/admin/flow/jobDone/jobDone_view.dart';
import 'package:saloon_app/services/admin/flow/Bookings/shedule_service.dart';


class BookingConfirmView extends StatefulWidget {
  final String appointmentId;

  const BookingConfirmView({Key? key, required this.appointmentId}) : super(key: key);

  @override
  State<BookingConfirmView> createState() => _BookingConfirmViewState();
}

class _BookingConfirmViewState extends State<BookingConfirmView> {
  Map<String, dynamic> appointmentDetails = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAppointmentDetails();
  }

  Future<void> fetchAppointmentDetails() async {
    try {
      final data = await ScheduleService().getAppointmentDetails(
        appointmentId: widget.appointmentId,
      );
      print("Fetched Appointment Details: $data");
      setState(() {
        appointmentDetails = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching appointment details: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    _buildHeader(context),
                    const SizedBox(height: 20),
                    _buildTitle(),
                    const SizedBox(height: 20),
                    _buildImage(),
                    const SizedBox(height: 30),
                    _buildServiceDetails(),
                    const SizedBox(height: 30),
                    _buildContactDetails(),
                    const SizedBox(height: 40),
                    _buildActionButtons(context),
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

  Widget _buildHeader(BuildContext context) {
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
              icon: const Icon(
                IconlyBold.notification,
                color: Color(0xFFB3B3B3),
                size: 28,
              ),
              onPressed: () {
                // Add notification action
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
        'Booking Details',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/cutbead.png',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildServiceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appointmentDetails['packageData']?['title'] ,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              appointmentDetails['date'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
            const Spacer(),
            Text(
              '${appointmentDetails['packageData']?['price']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.access_time, size: 16, color: Colors.black54),
            const SizedBox(width: 4),
            Text(
              appointmentDetails['timeSlot'] ?? 'Time Slot',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactDetails() {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF3FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            child: Image.asset('assets/images/icons/avatorface02.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointmentDetails['customerData']?['name'] ,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                 " appointmentDetails['customerData']?['address'] ",
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Image.asset('assets/images/icons/whatsapp.png'),
            onPressed: () {
              // Add WhatsApp action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            try {
              // Call the appointmentConfirm method and confirm the appointment
              await ScheduleService().appointmentConfirm(
                appointmentId: widget.appointmentId,
              );

              // Navigate to JobDoneView and pass the appointmentId
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobCompleteView()
                  //     JobDoneView(
                  //   appointmentId: widget.appointmentId,
                  // )
                ,
                ),
              );
            } catch (e) {
              print("Error confirming appointment: $e");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to confirm appointment. Please try again.'),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 120, 22, 5),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.check, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingRescheduleView(
                  appointmentId: widget.appointmentId, // Pass the appointmentId here
                ),
              ),
            );
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 120, 22, 5),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text(
            'Reschedule',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingReschedule2View(
                  appointmentId: widget.appointmentId,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFE5E5),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Cancel Session',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
