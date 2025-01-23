import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/splash/splash_3/splash_3_viewmodel.dart';

class Splash3View extends StatefulWidget {
  const Splash3View({super.key});

  @override
  Splash3State createState() => Splash3State();
}

class Splash3State extends State<Splash3View> {
  late Splash3Viewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Splash3Viewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Splash3Viewmodel(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: const Color(0xFF232E3E),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Title text
                  const Text(
                    "YOU GOT\nSWAG",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 219, 219, 219),
                      fontWeight: FontWeight.w900,
                      fontSize: 70,
                      height: 0.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //subtitle text
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Easy way to get styled",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 480),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 550),
                  child: Text(
                    "FEEL YA\nSTEEEZ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white.withOpacity(0.1),
                      fontWeight: FontWeight.w900,
                      fontSize: 106,
                      height: 0.8,
                    ),
                  ),
                ),
              ),
            ),

            //background image &
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Image.asset(
                      'assets/images/black&white man.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Text(
                          "FEEL YA\nSTEEEZ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white.withOpacity(0.09),
                            fontWeight: FontWeight.w900,
                            fontSize: 104,
                            height: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //get started button
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.onGetStartedButtonClick(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBF4011),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            elevation: 5,
                          ),
                          child: const Text(
                            'GET STARTED',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
