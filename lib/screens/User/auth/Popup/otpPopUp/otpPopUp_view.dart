import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/Popup/otpPopUp/otpPopUp_viewmodel.dart';

class OtpPopupView extends StatefulWidget {
  const OtpPopupView({super.key, required String userType});

  @override
  State<OtpPopupView> createState() => _OtpPopupViewState();
}

class _OtpPopupViewState extends State<OtpPopupView> {
  late List<TextEditingController> _controllers;
  int _secondsLeft = 59;
  bool _resendEnabled = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
    startTimer(
      onUpdate: (secondsLeft) {
        setState(() {
          _secondsLeft = secondsLeft;
        });
      },
      onComplete: () {
        setState(() {
          _resendEnabled = true;
        });
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "ENTER 4–DIGIT CODE",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "A 4 digit One-time password code has\nbeen sent to your registered email.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 46, 44, 44),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return buildOtpField(_controllers[index], context);
              }),
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: "Resend code: ",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
                children: [
                  TextSpan(
                    text: _resendEnabled ? "Send Now" : "${_secondsLeft}s",
                    style: TextStyle(
                      color: _resendEnabled
                          ? const Color.fromARGB(255, 30, 138, 226)
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildGradientButton(context, onPressed: _confirmOtp),
          ],
        ),
      ),
    );
  }

  void _confirmOtp() {
    String otp = _controllers.map((controller) => controller.text).join();
    print("Entered OTP: $otp");
    // Add your OTP confirmation logic here
  }
}

void showOtpPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const OtpPopupView(
      userType: '',
    ),
  );
}
