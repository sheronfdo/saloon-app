import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScheduleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> getLatestAppointments() async {
    try {
      QuerySnapshot querySnapshotNotComple = await _firestore
          .collection("appointment")
          .where("saloonId", isEqualTo: _auth.currentUser!.uid)
          .get();
      List<Map<String, dynamic>> appointments = [];
      for (QueryDocumentSnapshot appointmentDoc
          in querySnapshotNotComple.docs) {
        String customerId = appointmentDoc['customerId'];
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(customerId)
            .get();
        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          appointments.add({
            'appointmentId': appointmentDoc.id,
            'customerId': customerId,
            'customerName': userData['name'],
            'date': appointmentDoc['date'],
            'packageId': appointmentDoc['packageId'],
            'serviceCategory': appointmentDoc['serviceCategory'],
            'status': appointmentDoc['status'],
            'timeslot': appointmentDoc['timeslot']['time'],
            'price': appointmentDoc['price']
          });
        }
      }
      return appointments;
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getAppointmentsByDate(
      {required String day}) async {
    try {
      QuerySnapshot querySnapshotNotComple = await _firestore
          .collection("appointment")
          .where("saloonId", isEqualTo: _auth.currentUser!.uid)
          .where("date", isEqualTo: day)
          .get();
      List<Map<String, dynamic>> appointments = [];
      for (QueryDocumentSnapshot appointmentDoc
          in querySnapshotNotComple.docs) {
        String customerId = appointmentDoc['customerId'];
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(customerId)
            .get();
        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          appointments.add({
            'appointmentId': appointmentDoc.id,
            'customerId': customerId,
            'customerName': userData['name'],
            'date': appointmentDoc['date'],
            'packageId': appointmentDoc['packageId'],
            'serviceCategory': appointmentDoc['serviceCategory'],
            'status': appointmentDoc['status'],
            'timeslot': appointmentDoc['timeslot']['time'],
            'price': appointmentDoc['price']
          });
        }
      }
      return appointments;
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAppointmentDetails(
      {required String appointmentId}) async {
    try {
      DocumentSnapshot appointmentDoc =
          await _firestore.collection('appointment').doc(appointmentId).get();
      Map<String, dynamic> appointmentData =
          appointmentDoc.data() as Map<String, dynamic>;
      DocumentSnapshot packageDoc = await _firestore
          .collection("admins")
          .doc(appointmentData["saloonId"])
          .collection("categories")
          .doc(appointmentData["serviceCategory"])
          .collection("packages")
          .doc(appointmentData["packageId"])
          .get();
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(appointmentData["customerId"])
          .get();
      appointmentData["customerData"] = userDoc.data() as Map<String, dynamic>;
      appointmentData["packageData"] =
          packageDoc.data() as Map<String, dynamic>;
      return appointmentData;
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }

  Future<void> appointmentConfirm({required String appointmentId}) async {
    try {
      await _firestore
          .collection('appointment')
          .doc(appointmentId)
          .update({"status": "CONFIRMED"});
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }

  Future<void> rescheduledAppointment(
      {required String appointmentId,
      required String date,
      required Map<String, String> timeSlot}) async {
    Map<String, dynamic> map = {
      "rescheduledDate": date,
      "rescheduledTimeslot": timeSlot,
      "status": "RESCHEDULED"
    };
    await _firestore.collection('appointment').doc(appointmentId).update(map);
  }

  Future<void> appointmentJobComplete({required String appointmentId}) async {
    try {
      await _firestore
          .collection('appointment')
          .doc(appointmentId)
          .update({"status": "COMPLETED"});
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }

  Future<void> appointmentCancel(
      {required String appointmentId, required String reason}) async {
    try {
      await _firestore
          .collection('appointment')
          .doc(appointmentId)
          .update({"status": "CANCELED", "cancelReason": reason});
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getAvailabilityForReschedule(
      {required String day}) async {
    DocumentSnapshot dayDoc = await _firestore
        .collection('admins')
        .doc(_auth.currentUser!.uid)
        .collection("availability")
        .doc(day)
        .get();
    List<Map<String, dynamic>> timeSlots = [];
    if (dayDoc.exists) {
      timeSlots = List<Map<String, dynamic>>.from(
          (dayDoc.data() as Map<String, dynamic>)['time']);
    }
    print("timeslot");
    print(timeSlots);
    return timeSlots;
  }
}
