import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //step 1 basic details
  Future<void> registerAdminStep1({
    required String saloonName,
    required String phone,
    required String email,
    required String address,
    required String role,
    required BuildContext context,
  }) async {
    try {
      DocumentReference adminDoc = _firestore.collection('admins').doc();
      await adminDoc.set({
        'saloonName': saloonName,
        'phone': phone,
        'email': email,
        'address': address,
        'step': 1,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });

      //show alert
      Fluttertoast.showToast(
        msg: "Step 1 completed. Proceed to the next step!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate to OTP
      Navigator.pushNamed(context, '/buildOTPVerifyPage',
          arguments: adminDoc.id);
    } catch (e) {

      print("firabase exception ===== ======= "+e.toString());
      // Handle general errors
      Fluttertoast.showToast(
        msg: "An error occurred: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  //step 2
  Future<void> verifyOtp({
    required String adminId,
    required String otp,
    required BuildContext context,
  }) async {
    try {
      if (otp == "111222") {
        await _firestore.collection('admins').doc(adminId).update({
          'otpVerified': true,
          'step': 2,
        });

        Fluttertoast.showToast(
          msg: "OTP verified. Proceed to the next step!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0,
        );

        //navigate
        Navigator.pushNamed(context, '/buildBusinessDocsPage',
            arguments: adminId);
      } else {
        throw Exception("Invalid OTP");
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "OTP verification failed: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  //step 3
  Future<void> uploadDocuments({
    required String adminId,
    required String registrationNo,
    required String personInCharge,
    required String crImageUrl,
    required BuildContext context,
  }) async {
    try {
      await _firestore.collection('admins').doc(adminId).update({
        'registrationNo': registrationNo,
        'personInCharge': personInCharge,
        'crImageUrl': crImageUrl,
        'step': 3,
      });

      Fluttertoast.showToast(
        msg: "Documents uploaded successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate to screen
      Navigator.pushNamed(context, '/buildSetPasswordPage', arguments: adminId);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to upload documents: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  //step 4
  Future<void> setPassword({
    required String adminId,
    required String password,
    required BuildContext context,
  }) async {
    try {
      DocumentSnapshot adminSnapshot =
          await _firestore.collection('admins').doc(adminId).get();
      String email = adminSnapshot['email'];

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('admins').doc(adminId).update({
        'uid': userCredential.user!.uid,
        'step': 4,
      });

      Fluttertoast.showToast(
        msg: "Password set successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate
      Navigator.pushNamed(context, '/buildAddAvailabilityPage',
          arguments: adminId);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Password setup failed: ${e.message}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An error occurred: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  //step 5
  Future<void> setAvailability({
    required String adminId,
    required List<String> workingDays,
    required String workingHours,
    required BuildContext context,
  }) async {
    try {
      await _firestore.collection('admins').doc(adminId).update({
        'workingDays': workingDays,
        'workingHours': workingHours,
        'step': 5,
      });

      Fluttertoast.showToast(
        msg: "Availability set successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate
      Navigator.pushNamed(context, '/buildAddProfileImagePage',
          arguments: adminId);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to set availability: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  //step 6
  Future<void> addProfilePhoto({
    required String adminId,
    required String profilePhotoUrl,
    required BuildContext context,
  }) async {
    try {
      await _firestore.collection('admins').doc(adminId).update({
        'profilePhotoUrl': profilePhotoUrl,
        'step': 6,
      });

      Fluttertoast.showToast(
        msg: "Profile photo added successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate
      Navigator.pushNamed(context, '/buildRegistrationSuccessPage',
          arguments: adminId);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to add profile photo: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  // Step 7
  Future<void> acceptTerms({
    required String adminId,
    required BuildContext context,
  }) async {
    try {
      await _firestore.collection('admins').doc(adminId).update({
        'termsAccepted': true,
        'registrationComplete': true,
      });

      Fluttertoast.showToast(
        msg: "Registration completed successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      // Navigate
      Navigator.pushReplacementNamed(context, '/AdminLoginView');
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to complete registration: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }
}
