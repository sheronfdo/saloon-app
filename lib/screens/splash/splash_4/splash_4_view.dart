import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/splash/splash_4/splash_4_viewmodel.dart';

class Splash4View extends StatefulWidget {
  const Splash4View({super.key});

  @override
  Splash4State createState() => Splash4State();
}

class Splash4State extends State<Splash4View> {
  late Splash4Viewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Splash4Viewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Splash4Viewmodel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Background image
            Positioned(
              top: 0,
              // right: -140,
              child: Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'assets/images/splash4.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
              ),
            ),

            // Gradient overlay
            // Container(
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Colors.transparent,
            //         Colors.black,
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //   ),
            // ),

            // Content
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'WELCOME to',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Google Sans',
                        letterSpacing: 1,
                      ),
                    ),
                    const Text(
                      'SALOON APP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Best Saloon app in Dubai. Easy way to manage your beauty.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.onJoinAsUserButtonClick(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(121, 40, 10, 1),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        minimumSize: const Size(350, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Join as User',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.onSaloonAdminButtonClick(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBF4011),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        minimumSize: const Size(350, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Saloon Administrator',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
