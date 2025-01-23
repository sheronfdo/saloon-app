import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(255, 120, 111, 111),
  );

  static const TextStyle mainHeading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(255, 49, 48, 48),
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    color: AppColors.gray,
  );

  static const TextStyle linkText = TextStyle(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle fieldName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    color: Color.fromARGB(255, 44, 42, 42),
    fontWeight: FontWeight.bold,
  );
}
