import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_2/appoinment_2_viewmodel.dart';
import 'package:saloon_app/screens/User/flow/home/home_view.dart';
import '../../../../../components/custom/custom_btn.dart';

class Appoinment2View extends StatefulWidget {
  const Appoinment2View({super.key});

  @override
  Appoinment2State createState() => Appoinment2State();
}

class Appoinment2State extends State<Appoinment2View> {
  late Appoinment2Viewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Appoinment2Viewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 240,
                height: 210,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 239, 239),
                  //color: Color.fromARGB(255, 112, 31, 31),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(130),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 220,
                height: 190,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 222, 222),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(130),
                  ),
                ),
              ),
            ),
            //appBar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 120),
                 
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFFBF4011),
                      size: 80,
                    ),
                    
                  const SizedBox(height: 20),
                  const Text(
                    'Successfully placed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'PRO HAIR CUT',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const Text.rich(
                    TextSpan(
                      text: 'From ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'MR.SALOON',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildDetailRow('Customer name', 'Alveera Aliba'),
                buildDetailRow('Service name', 'Pro Hair Cut'),
                buildDetailRow('Price', '50 USD'),
                buildDetailRow('Appointment time', '8.30 am - 9.30 am'),
                buildDetailRow('Appointment date', '2024 April 14'),
                
                  const SizedBox(height: 30),
                  const Text(
                    'Order Reference',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '48892337912',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You’ll be notify when saloon administrator\nconfirmed your order',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Builder(
                      builder: (BuildContext context) {
                        return CustomButton(
                          text: 'HOME',
                          onPressed: () {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                        HomeView()),
                                );
                          },
                        );
                      },
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

 Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
