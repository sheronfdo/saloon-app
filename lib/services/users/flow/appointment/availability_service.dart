import 'package:cloud_firestore/cloud_firestore.dart';

class AvailabilityService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAvailability(
      {required String saloonId, required String day}) async {
    DocumentSnapshot dayDoc = await _firestore
        .collection('admins')
        .doc(saloonId)
        .collection("availability")
        .doc(day)
        .get();
    List<Map<String, dynamic>> timeSlots = [];
    if (dayDoc.exists) {
      timeSlots = List<Map<String, dynamic>>.from(
          (dayDoc.data() as Map<String, dynamic>)['time']);
    }
    return timeSlots;
  }
}
