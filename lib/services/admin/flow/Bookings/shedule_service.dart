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
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('appointment')
          .doc(appointmentId)
          .get();
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      
      return userData;
    } catch (e) {
      print("Error fetching appointments: $e");
      rethrow;
    }
  }
}
