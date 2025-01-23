import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saloon_app/screens/splash/splash_1/splash_1_view.dart';
import 'package:saloon_app/screens/splash/splash_2/splash_2_view.dart';
import 'package:saloon_app/screens/splash/splash_3/splash_3_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          Splash1View(),
          Splash2View(),
          Splash3View(),
        ],
      ),
    );
  }
}
