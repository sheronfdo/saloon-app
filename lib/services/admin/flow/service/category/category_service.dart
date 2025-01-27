import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getIcon(String icon) {
    switch (icon) {
      case 'content_cut':
        return Icons.content_cut;
      case 'spa':
        return Icons.spa;
      case 'face':
        return Icons.face;
    }
  }

  Future<List<Map<String, dynamic>>> collectCategories() async {
    CollectionReference userCategories = _firestore
        .collection('admins')
        .doc(_auth.currentUser?.uid)
        .collection('categories');
    QuerySnapshot userCategoriesSnapshot = await userCategories.get();
    List<Map<String, dynamic>> tempCategories = [];
    CollectionReference generalCategories = _firestore
        .collection('categories');
    for (QueryDocumentSnapshot userCategoryDoc in userCategoriesSnapshot.docs) {
      DocumentSnapshot generalCategoryDoc = await generalCategories.doc(
          userCategoryDoc.id).get();
      if (generalCategoryDoc.exists) {
        Map<String, dynamic> generalCategoryData = generalCategoryDoc
            .data() as Map<String, dynamic>;
        tempCategories.add({
          'id': userCategoryDoc.id,
          'name': generalCategoryData['name'],
          'label': generalCategoryData['label'],
          'icon': getIcon(generalCategoryData['icon']),
          'color': Color(generalCategoryData['color'])
        });
      }
    }
    return tempCategories;
  }
}
