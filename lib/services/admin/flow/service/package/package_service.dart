import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PackageService {
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
      'isDeactivated': false
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
      'isDeactivated': false
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
        .set({'isDeactivated': true});
  }

  Future<void> deletePackage(
      {required String catId, required String packageId}) async {
    await _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .collection("packages")
        .doc(packageId)
        .delete();
  }

  Future<List<Map<String, dynamic>>> collectUserCategoryPackages(
      {required String catId}) async {
    CollectionReference packages = _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .collection("packages");
    QuerySnapshot packagesSnapshot = await packages.get();
    List<Map<String, dynamic>> tempPackages = [];
    for (QueryDocumentSnapshot packageDoc in packagesSnapshot.docs) {
      tempPackages.add({
        'id': packageDoc.id,
        'title': packageDoc["title"],
        'price': packageDoc['price'],
        'description': packageDoc['description'],
        'imagePath': 'assets/images/cutbead.png',
        'isDeactivated': packageDoc['isDeactivated']
      });
    }
    return tempPackages;
  }
}
