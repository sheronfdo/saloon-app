import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewCategoryViewmodel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // List<Map<String, String>> serviceCategories = [];
  // bool isLoading = true;

  void init() {
    //Initialization code here
  }
  // void onBookAppointmentClick(BuildContext context) {
  //   //appointment confirm screen
  // }

  //
  //
  // // Function to fetch categories from Firestore
  // Future<void> fetchServiceCategories() async {
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('serviceCategories')
  //         .get();
  //
  //     serviceCategories = querySnapshot.docs.map((doc) {
  //       return {
  //         "id": doc.id, // Document ID
  //         "name": doc["name"] as String, // Explicitly cast to String
  //       };
  //     }).toList();
  //
  //     isLoading = false;
  //     notifyListeners(); // Notify UI to update
  //   } catch (e) {
  //     print("Error fetching categories: $e");
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

}
