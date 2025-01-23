import 'package:flutter/material.dart';

void startTimer({
  required Function(int) onUpdate,
  required VoidCallback onComplete,
}) {
  int secondsLeft = 59;
  Future.delayed(const Duration(seconds: 1), () {
    if (secondsLeft > 0) {
      secondsLeft--;
      onUpdate(secondsLeft);
      startTimer(onUpdate: onUpdate, onComplete: onComplete);
    } else {
      onComplete();
    }
  });
}

Widget buildOtpField(TextEditingController controller, BuildContext context) {
  return Container(
    width: 50,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        counterText: "",
        border: InputBorder.none,
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}

Widget buildGradientButton(BuildContext context,
    {required VoidCallback onPressed}) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFFBF4011),
          Color(0xFF79280A),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        "Confirm",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}
