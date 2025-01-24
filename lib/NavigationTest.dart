import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_1/forget_password_1_view.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_2/forget_password_2_view.dart';
import 'package:saloon_app/screens/User/auth/login/login_view.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_1/appoinment_1_view.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_2/appoinment_2_view.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_details/bokking_details_view.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_reshedule/booking_reshedule_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import 'package:saloon_app/screens/User/flow/profile/edit_profile/edit_profile_view.dart';
import 'package:saloon_app/screens/User/flow/profile/my_profile/my_profile_view.dart';
import 'package:saloon_app/screens/User/flow/profile/notification/notification/notification_view.dart';
import 'package:saloon_app/screens/User/flow/profile/privacy/privacy_view.dart';
import 'package:saloon_app/screens/User/flow/profile/rate/rate_view.dart';
import 'package:saloon_app/screens/User/flow/service/service_view.dart';
import 'package:saloon_app/screens/User/flow/shop/shop_view.dart';

class NavigationTest extends StatelessWidget {
  const NavigationTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Navigation Test'),
      ),
      body: ListView(
        children: [
          // _buildTextButton(context, 'Forget Password 1',  ForgetPassword1View()),
          // _buildTextButton(context, 'Forget Password 2', const ForgetPassword2View()),
          // _buildTextButton(context, 'Login', const LoginView()),
          // _buildTextButton(context, 'Signup', const SignupView()),
          // _buildTextButton(context, 'OTP Popup', const OtpPopUpView()),
          // _buildTextButton(context, 'Success Popup', const SuccessPopUpView()),
          //**Appointment
          _buildTextButton(context, 'Appointment 1', const Appoinment1View()),
          _buildTextButton(context, 'Appointment 2', const Appoinment2View()),
          //**booking
          _buildTextButton(context, 'Appointment 1', const BookingDetailsView()),
          _buildTextButton(context, 'Appointment 2', const BookingResheduleView()),
          _buildTextButton(context, 'Home', const HomeView()),
          _buildTextButton(context, 'Profile', const MyProfileView()),
          _buildTextButton(context, 'Edit Profile', const EditProfileView()),
          _buildTextButton(context, 'Notifications', const NotificationView()),
          _buildTextButton(context, 'Privacy', const PrivacyView()),
          _buildTextButton(context, 'Rate',  RateWorkerPopup()),
          _buildTextButton(context, 'Service', const ServiceView()),
          _buildTextButton(context, 'Shop', const ShopView()),
        ],
      ),
    );
  }

  Widget _buildTextButton(BuildContext context, String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(label),
      ),
    );
  }
}