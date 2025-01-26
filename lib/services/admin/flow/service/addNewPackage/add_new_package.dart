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

  Future<void> editPackage(
      {required String catId,
      required String packageId,
      required String title,
      required double price,
      required String description}) async {
    await _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .collection("packages")
        .doc(packageId)
        .set({
      'title': title,
      'price': price,
      'description': description,
      'status': 'active'
    });
  }

  Future<void> deactivatePackage(
      {required String catId, required String packageId}) async {
    await _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .collection("packages")
        .doc(packageId)
        .set({'status': 'deactivate'});
  }

  Future<void> deletePackage(
      {required String catId, required String packageId}) async {
    await _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .collection("packages")
        .doc(packageId).delete();
  }
}
