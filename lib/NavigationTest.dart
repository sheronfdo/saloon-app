import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_1/forget_password_1_view.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_2/forget_password_2_view.dart';
import 'package:saloon_app/screens/User/auth/login/login_view.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_1/appoinment_1_view.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_2/appoinment_2_view.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_details/bokking_details_view.dart';
import 'package:saloon_app/screens/User/flow/bookings/booking_reshedule/booking_reshedule_view.dart';
import 'package:saloon_app/screens/User/flow/bookings/bookings/booking_header_view.dart';
import 'package:saloon_app/screens/User/flow/bookings/cancel_bokking/cancel_booking_view.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import 'package:saloon_app/screens/User/flow/profile/appointment_done/appointment_done_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_cancelled/booking_cancelled_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_confirmed/booking_confirmed_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_doing/booking_doing_view.dart';
import 'package:saloon_app/screens/User/flow/profile/edit_profile/edit_profile_view.dart';
import 'package:saloon_app/screens/User/flow/profile/my_profile/my_profile_view.dart';
import 'package:saloon_app/screens/User/flow/profile/notification/notification/notification_view.dart';
import 'package:saloon_app/screens/User/flow/profile/notification_setting/notification_setting_view.dart';
import 'package:saloon_app/screens/User/flow/profile/privacy/privacy_view.dart';
import 'package:saloon_app/screens/User/flow/profile/rate/rate_view.dart';
import 'package:saloon_app/screens/User/flow/saloon/bio/bioDetails_view.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details1/details1_view.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details2/details2_view.dart';
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

    //user
          Text("User Nav"),
          //**Appointment
          // _buildTextButton(context, 'Appointment 1', const Appoinment1View()),
          _buildTextButton(context, 'Appointment 2', const Appoinment2View()),
          //**booking
          _buildTextButton(context, 'BookingDetailsView', const BookingDetailsView()),
          _buildTextButton(context, 'BookingResheduleView', const BookingResheduleView()),
          _buildTextButton(context, 'BookingheaderView', const BookingheaderView()),
          _buildTextButton(context, 'CancelBookingView', const CancelBookingView()),
          //**home
          _buildTextButton(context, 'Home', const HomeView()),
          //**profile
          _buildTextButton(context, 'BookingSuccessPage', const BookingSuccessPage()),
          _buildTextButton(context, 'BookingCancelledView', const BookingCancelledView()),
          _buildTextButton(context, 'BookingConfirmedPage', const BookingConfirmedPage()),
          _buildTextButton(context, 'BookingDoingView', const BookingDoingView()),
          _buildTextButton(context, 'EditProfileView', const EditProfileView()),
          _buildTextButton(context, 'MyProfileView', const MyProfileView()),
          _buildTextButton(context, 'NotificationView', const NotificationView()),
          _buildTextButton(context, 'NotificationSettingView', const NotificationSettingView()),
          _buildTextButton(context, 'PrivacyView', const PrivacyView()),
          _buildTextButton(context, 'RateWorkerPopup',  RateWorkerPopup()),
          _buildTextButton(context, 'BioDetailsView', const BioDetailsView()),
          // _buildTextButton(context, 'Details1view', const Details1view()),
          _buildTextButton(context, 'Details2View', const Details2View()),
          _buildTextButton(context, 'Service', const ServiceView()),
          // _buildTextButton(context, 'Shop', const ShopView()),
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