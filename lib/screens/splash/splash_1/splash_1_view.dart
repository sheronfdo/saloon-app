import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/splash/splash_1/splash_1_viewmodel.dart';

class Splash1View extends StatefulWidget {
  const Splash1View({super.key});

  @override
  Splash1State createState() => Splash1State();
}

class Splash1State extends State<Splash1View> {
  late Splash1Viewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Splash1Viewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Splash1Viewmodel(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: const Color(0xFF232E3E),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Title text
                  Text(
                    "BEAUTY\nIS YOU!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 219, 219, 219),
                      fontWeight: FontWeight.w900,
                      fontSize: 70,
                      height: 0.8,
                    ),
                  ),
                  SizedBox(height: 20),
                  //subtitle text
                  Text(
                    "Easy way to get styled",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(179, 255, 252, 252),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 480),
                  Row(
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
                    "BEAUTY\nIS YOU!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white.withOpacity(0.1),
                      fontWeight: FontWeight.w900,
                      fontSize: 98,
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
                      'assets/images/Portrait of handsome looking man.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "BEAUTY\nIS  YOU!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white.withOpacity(0.09),
                            fontWeight: FontWeight.w900,
                            fontSize: 98,
                            height: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //button continue and skip
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //continue button
                            ElevatedButton(
                              onPressed: () {
                                viewModel.onContinueButtonClick(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Continue >',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            //row this dots
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 28, 26, 26),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),

                            //skip button
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.onSkipButtonClick(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Skip >>',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
