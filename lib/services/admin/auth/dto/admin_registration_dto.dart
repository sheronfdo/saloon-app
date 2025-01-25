import 'package:firebase_auth/firebase_auth.dart';

class AdminRegistrationDTO {
  late String _saloonName;
  late String _phoneNumber;
  late String _email;
  late String _address;
  late String _registrationNumber;
  late String _personInCharge;
  late String _password;
  late String _otpVerificationId;
  late UserCredential _userCredential;

  String get saloonName => _saloonName;

  set saloonName(String value) {
    _saloonName = value;
  }

  String get otpVerificationId => _otpVerificationId;

  set otpVerificationId(String value) {
    _otpVerificationId = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get personInCharge => _personInCharge;

  set personInCharge(String value) {
    _personInCharge = value;
  }

  String get registrationNumber => _registrationNumber;

  set registrationNumber(String value) {
    _registrationNumber = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  UserCredential get userCredential => _userCredential;

  set userCredential(UserCredential value) {
    _userCredential = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}