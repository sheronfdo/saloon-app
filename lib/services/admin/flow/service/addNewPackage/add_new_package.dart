import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddNewPackageService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNewPackage(
      {required String catId,
      required String title,
      required double price,
      required String description}) async {
    await _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .collection("packages")
        .doc()
        .set({
      'title': title,
      'price': price,
      'description': description,
      'status': 'active'
    });
  }
}
