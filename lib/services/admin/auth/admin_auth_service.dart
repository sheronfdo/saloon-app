import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_app/screens/admin/flow/home/admin_home_view.dart';
import 'package:saloon_app/services/admin/auth/dto/admin_registration_dto.dart';

class AdminAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static AdminRegistrationDTO adminRegistrationDTO = new AdminRegistrationDTO();

  //step 1 basic details
  Future<void> registerAdminStep1({
    required String saloonName,
    required String phone,
    required String email,
    required String address,
    required BuildContext context,
  }) async {
    try {
      // DocumentReference adminDoc = _firestore.collection('admins').doc();
      // await adminDoc.set({
      //   'saloonName': saloonName,
      //   'phone': phone,
      //   'email': email,
      //   'address': address,
      //   'step': 1,
      //   'role': role,
      //   'createdAt': FieldValue.serverTimestamp(),
      // });
      //
      // //show alert
      // Fluttertoast.showToast(
      //   msg: "Step 1 completed. Proceed to the next step!",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      //   fontSize: 14.0,
      // );
      adminRegistrationDTO.saloonName = saloonName;
      adminRegistrationDTO.phoneNumber = phone;
      adminRegistrationDTO.email = email;
      adminRegistrationDTO.address = address;

      await _auth.verifyPhoneNumber(
        phoneNumber: adminRegistrationDTO.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          adminRegistrationDTO.otpVerificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print("step 1 ==== "+ adminRegistrationDTO.email+" "+adminRegistrationDTO.saloonName);
      //navigate to OTP
      // Navigator.pushNamed(context, '/buildOTPVerifyPage');
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
    // required String adminId,
    required String otp,
    required BuildContext context,
  }) async {
    try {
      if (otp != "000000") {
        // await _firestore.collection('admins').doc().update({
        //   'otpVerified': true,
        //   'step': 2,
        // });
        //
        // Fluttertoast.showToast(
        //   msg: "OTP verified. Proceed to the next step!",
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.BOTTOM,
        //   backgroundColor: Colors.green,
        //   textColor: Colors.white,
        //   fontSize: 14.0,
        // );

        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: adminRegistrationDTO.otpVerificationId, smsCode: otp);
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
          print('Successfully signed in!');
        } catch (e) {
          print('Error signing in: $e');
        }

        //navigate
        // Navigator.pushNamed(context, '/buildBusinessDocsPage');
      } else {
        // Navigator.pushNamed(context, '/buildBusinessDocsPage');
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
    required String registrationNo,
    required String personInCharge,
    required String crImageUrl,
    required BuildContext context,
  }) async {
    try {
      // await _firestore.collection('admins').doc(adminId).update({
      //   'registrationNo': registrationNo,
      //   'personInCharge': personInCharge,
      //   'crImageUrl': crImageUrl,
      //   'step': 3,
      // });
      //
      // Fluttertoast.showToast(
      //   msg: "Documents uploaded successfully!",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      //   fontSize: 14.0,
      // );

      adminRegistrationDTO.registrationNumber = registrationNo;
      adminRegistrationDTO.personInCharge = personInCharge;

      print("step 3 ==== "+ adminRegistrationDTO.registrationNumber+" "+adminRegistrationDTO.personInCharge);
      //navigate to screen
      // Navigator.pushNamed(context, '/buildSetPasswordPage');
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
    required String password,
    required BuildContext context,
  }) async {
    try {
      adminRegistrationDTO.password = password;


      print("step 4 ==== "+ adminRegistrationDTO.password);

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: adminRegistrationDTO.email,
        password: adminRegistrationDTO.password,
      );

      // need to link phone auth credential with this user credentials

      await _firestore.collection('admins').doc(userCredential.user?.uid).set({
        'saloonName': adminRegistrationDTO.saloonName,
        'phoneNumber': adminRegistrationDTO.phoneNumber,
        'email': adminRegistrationDTO.email,
        'address': adminRegistrationDTO.address,
        'registrationNumber': adminRegistrationDTO.registrationNumber,
        'personInCharge': adminRegistrationDTO.personInCharge,
        'role' : "admin"
      });

      adminRegistrationDTO.userCredential = userCredential;

      Fluttertoast.showToast(
        msg: "Password set successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate
      // Navigator.pushNamed(context, '/buildAddAvailabilityPage');
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


  //login (support email and phone No)
  Future<void> login({
    required String emailOrPhone,
    required String password,
    required BuildContext context,
  }) async {
    try {
      String email = emailOrPhone;

      // Check if the input is a phone number
      if (!emailOrPhone.contains('@')) {
        // Query Firestore for the phone number
        QuerySnapshot phoneCheck = await _firestore
            .collection('admins')
            .where('phone', isEqualTo: emailOrPhone)
            .get();

        if (phoneCheck.docs.isNotEmpty) {
          // Extract email from Firestore if phone exists
          email = phoneCheck.docs.first.get('email');
        } else {
          // Throw error if phone number is not found
          throw FirebaseAuthException(
            code: 'user-not-found',
            message: 'No user found with this phone number.',
          );
        }
      }

      // Authenticate using email and password
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Show success message
      Fluttertoast.showToast(
        msg: "Login successful!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminHomeView()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions
      String errorMessage = e.message ?? 'An error occurred.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email or phone number.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      }
      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      // Handle unexpected errors
      Fluttertoast.showToast(
        msg: "An unexpected error occurred: ${e.toString()}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
