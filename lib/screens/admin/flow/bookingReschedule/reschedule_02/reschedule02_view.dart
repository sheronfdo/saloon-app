import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/admin/flow/rejectedBooking/rejectBooking_view.dart';
import 'package:saloon_app/services/admin/flow/Bookings/shedule_service.dart';

class BookingReschedule2View extends StatefulWidget {
  final String appointmentId;
  const BookingReschedule2View({Key? key, required this.appointmentId}) : super(key: key);

  @override
  BookingReschedule2State createState() => BookingReschedule2State();
}

class BookingReschedule2State extends State<BookingReschedule2View> {
  bool isOtherSelected = false;
  final TextEditingController _reasonController = TextEditingController();
  List<String> selectedReasons = [];

  @override
  void initState() {
    super.initState();
    // Fetch appointment details if needed here
  }

  // Method to handle the reason for cancellation and navigation
  Future<void> _handleCancelAppointment() async {
    // Combine the selected checkbox titles and the text in the reason field
    String reason = selectedReasons.join(", ");
    if (isOtherSelected && _reasonController.text.isNotEmpty) {
      reason += ", ${_reasonController.text}";
    }

    try {
      // Call appointmentCancel method from ScheduleService
      await ScheduleService().appointmentCancel(
        appointmentId: widget.appointmentId,
        reason: reason,
      );
      // Navigate to RejectBookingView
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RejectBookingView()),
      );
    } catch (e) {
      print("Error cancelling appointment: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to cancel appointment. Please try again.')),
      );
    }
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
                    const SizedBox(height: 20),
                    _buildBookingDetails(),
                    const SizedBox(height: 20),
                    _buildReasonForCancellation(),
                    const SizedBox(height: 20),
                    _buildConfirmButton(context),
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
              color: Color(0xFFFFF0F0),
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
              color: Color(0xFFFEE3E3),
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
              onPressed: () {},
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
        'Cancel Booking',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBookingDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Pro Hair Cut 01',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Monday, 28 Oct',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '8:00 am - 11:00 am',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        const Text(
          'AED 220.00',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildReasonForCancellation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reason for cancellation',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CheckboxListTile(
          value: selectedReasons.contains('I am unavailable at that day & time (Rejection)'),
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedReasons.add('I am unavailable at that day & time (Rejection)');
              } else {
                selectedReasons.remove('I am unavailable at that day & time (Rejection)');
              }
            });
          },
          title: const Text('I am unavailable at that day & time (Rejection)'),
        ),
        // Repeat for other checkboxes as needed
        CheckboxListTile(
          value: selectedReasons.contains('I am unavailable at that day & time (Rejection)'),
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedReasons.add('I am unavailable at that day & time (Rejection)');
              } else {
                selectedReasons.remove('I am unavailable at that day & time (Rejection)');
              }
            });
          },
          title: const Text('I am unavailable at that day & time (Rejection)'),
        ),
        // Other checkboxes here...
        CheckboxListTile(
          value: isOtherSelected,
          onChanged: (value) {
            setState(() {
              isOtherSelected = value!;
            });
          },
          title: const Text('Other (Tell us why)'),
        ),
        if (isOtherSelected)
          TextField(
            controller: _reasonController,
            maxLines: 6,
            decoration: const InputDecoration(
              hintText: 'Enter your reason here...',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(),
            ),
          ),
      ],
    );
  }


  Widget _buildConfirmButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _handleCancelAppointment,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9E4529),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Confirm',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
