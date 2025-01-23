import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/auth/Popup/successPopUp/successPopUp_viewmodel.dart';

class SuccessPopupView extends StatelessWidget {
  const SuccessPopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                // Background image design
                SizedBox(
                  width: 200,
                  height: 150,
                  child: CustomPaint(
                    painter: DotsPainter(),
                  ),
                ),
                // Main image design
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/icons/popup.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Password changed\nsuccessfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
