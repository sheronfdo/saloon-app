import 'package:flutter/material.dart';
import 'package:saloon_app/services/admin/flow/Bookings/shedule_service.dart';


class ScheduleCardSection extends StatelessWidget {
  final ScheduleService _scheduleService = ScheduleService();

   ScheduleCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest Schedules',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the booking view (if needed)
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _scheduleService.getLatestAppointments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No appointments found.'));
              } else {
                List<Map<String, dynamic>> appointments = snapshot.data!;
                print("data list");
                print("Appointments: ${appointments}");
                return SingleChildScrollView(
                  child: Column(
                    children: appointments.map((appointment) {
                      Map<String, dynamic> userDetails = appointment;
                      return ScheduleCard(
                        day: appointment["date"],
                        date: appointment["date"],
                        name: userDetails["customerName"],
                        time: appointment["timeslot"].toString(),
                        price: "AED ${appointment["price"] ?? 'N/A'}",
                        imagePath: 'assets/images/icons/avatorface01.png',
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String day;
  final String date;
  final String name;
  final String time;
  final String price;
  final String imagePath;

  const ScheduleCard({
    super.key,
    required this.day,
    required this.date,
    required this.name,
    required this.time,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 121, 40, 10),
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
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
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
