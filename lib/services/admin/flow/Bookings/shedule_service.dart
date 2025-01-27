import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getLatestAppointments() async {
    try {
      // Fetch appointments with no status field (null)
      QuerySnapshot noStatusSnapshot = await _firestore
          .collection("appointment")
          .where("status", isNull: true) // Appointments with no status field
          .orderBy("date", descending: true)
          .orderBy("timeslot", descending: true)
          .get();

      // Fetch appointments with status not equal to "complete"
      QuerySnapshot notCompleteSnapshot = await _firestore
          .collection("appointment")
          .where("status", isNotEqualTo: "complete") // Appointments with status != "complete"
          .orderBy("date", descending: true)
          .orderBy("timeslot", descending: true)
          .get();

      // Combine the results
      List<Map<String, dynamic>> appointments = [];

      // Process appointments with no status field
      for (var doc in noStatusSnapshot.docs) {
        Map<String, dynamic> appointment = doc.data() as Map<String, dynamic>;
        DocumentSnapshot userSnapshot = await _firestore
            .collection("users")
            .doc(appointment["customerId"])
            .get();
        appointment["userDetails"] = userSnapshot.data() as Map<String, dynamic>;
        appointments.add(appointment);
      }

      // Process appointments with status not equal to "complete"
      for (var doc in notCompleteSnapshot.docs) {
        Map<String, dynamic> appointment = doc.data() as Map<String, dynamic>;
        DocumentSnapshot userSnapshot = await _firestore
            .collection("users")
            .doc(appointment["customerId"])
            .get();
        appointment["userDetails"] = userSnapshot.data() as Map<String, dynamic>;
        appointments.add(appointment);
      }

      // Sort combined results by date and time (latest first)
      appointments.sort((a, b) {
        int dateComparison = b["date"].compareTo(a["date"]);
        if (dateComparison != 0) return dateComparison;
        return b["timeslot"].compareTo(a["timeslot"]);
      });

      return appointments;
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }
}