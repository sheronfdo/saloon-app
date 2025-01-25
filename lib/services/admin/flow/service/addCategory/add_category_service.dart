import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddCategoryService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, String>>> collectGeneralCategories() async {
    CollectionReference categories =
        FirebaseFirestore.instance.collection('categories');
    QuerySnapshot querySnapshot = await categories.get();
    List<Map<String, String>> tempList = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        'name': doc['name'].toString(),
      };
    }).toList();
    return tempList;
  }

  Future<void> addUserCategory(
      {required String catId, required String catName}) async {
    // print("user "+ _auth.currentUser!.uid.toString());
    await _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection("categories")
        .doc(catId)
        .set({'categoryName': catName});
  }
}
