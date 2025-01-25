import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CategoryService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> collectCategories() async {
    CollectionReference userCategories = _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('categories');
    QuerySnapshot userCategoriesSnapshot = await userCategories.get();
    List<Map<String, dynamic>> tempCategories = [];
    CollectionReference generalCategories = _firestore
        .collection('categories');
    for (QueryDocumentSnapshot userCategoryDoc in userCategoriesSnapshot.docs) {
      DocumentSnapshot generalCategoryDoc = await generalCategories.doc(userCategoryDoc.id).get();
      if (generalCategoryDoc.exists) {
        Map<String, dynamic> generalCategoryData = generalCategoryDoc.data() as Map<String, dynamic>;
        tempCategories.add({
          'id': userCategoryDoc.id,
          'name': generalCategoryData['name'],
          'label': generalCategoryData['label'],
          'icon': generalCategoryData['icon'],
          'color': generalCategoryData['color']
        });
      }
    }
    return tempCategories;
  }
}
