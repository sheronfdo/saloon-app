import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saloon_app/firebase_options.dart';
import 'package:saloon_app/screens/admin/flow/home/admin_home_view.dart';
import 'package:saloon_app/screens/admin/login/admin_login_view.dart';
import 'package:saloon_app/screens/admin/registration/admin_signup_view.dart';
import 'package:saloon_app/screens/splash/splash_1/splash_1_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Beauty Qatar',
      debugShowCheckedModeBanner: false,
      home: Splash1View(),
     
    );
  }
}
