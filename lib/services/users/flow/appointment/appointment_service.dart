import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> makeAppointment(
      {required String saloonId,
      required String catId,
      required String packageId,
      required String date,
      required Map<String, String> timeSlot}) async {
    Map<String, dynamic> map = {
      "saloonId": saloonId,
      "customerId": _auth.currentUser!.uid,
      "serviceCategory": catId,
      "packageId": packageId,
      "date": date,
      "timeslot": timeSlot
    };
    _firestore.collection("appointment").doc().set(map);
  }
}
