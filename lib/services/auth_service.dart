import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_app/screens/User/auth/login/login_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  //signup
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String role, //admin or customer
    required BuildContext context,
  }) async {
    try {
      //create user with email & password
      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await auth.verifyPhoneNumber(
        phoneNumber: '+94770470323',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      //UID user
      String uid = userCredential.user!.uid;

      //save additional details firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'role': role,
        'createdAt': DateTime.now(),
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

  //login
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Authenticate user with Firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Show success message
      Fluttertoast.showToast(
        msg: "Login successful!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      // Navigate to HomeView after successful login
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions
      String message = '';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      // Show error message
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
      );
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

  //signout
  Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    //navigate  the login page
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginView()));
  }
}
