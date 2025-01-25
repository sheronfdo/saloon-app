import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_app/screens/User/auth/login/login_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';

class UserAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String role,
    required BuildContext context,
  }) async {
    try {
      //check if phone no already exists (firestore)
      QuerySnapshot phoneCheck = await _firestore
          .collection('users')
          .where('phone', isEqualTo: phone)
          .get();

      if (phoneCheck.docs.isNotEmpty) {
        throw FirebaseException(
            code: 'phone-already-in-use ',
            plugin: '',
            message: 'This is phone number is already registered.');
      }

      //create user with email & password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      await _auth.verifyPhoneNumber(
        phoneNumber: '+94770470323',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      //UID user
      String uid = userCredential.user!.uid;

      //save additional details firestore
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'role': role,
        //'imageUrl': '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      //show success
      Fluttertoast.showToast(
        msg: "Signup successful!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate to login page
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginView()));
    } on FirebaseAuthException catch (e) {
      String message = '';

      // Handle specific FirebaseAuth errors
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is invalid.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      // Show error toast
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      //navigate to view
      if (role == 'user') {
        Navigator.pushReplacementNamed(context, '/home_view.dart');
      } else if (role == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin_home');
      }
    } catch (e) {
      // Handle unexpected errors
      Fluttertoast.showToast(
        msg: "An unexpected error occurred: ${e.toString()}",
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
            .collection('users')
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
        MaterialPageRoute(builder: (context) => const HomeView()),
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

  //signout
  Future<void> signout({required BuildContext context}) async {
    await _auth.signOut();
    //navigate  the login page
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  //fetch details firestore
  Future<Map<String, dynamic>> fetchUserData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw FirebaseAuthException(
        code: 'no-user',
        message: 'No user is logged in.',
      );
    }

    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(currentUser.uid).get();

    if (!userDoc.exists) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'User data not found in Firestore.',
      );
    }

    return userDoc.data() as Map<String, dynamic>;
  }
}
