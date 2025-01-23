import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/new-custom-app-bar.dart';
import 'package:saloon_app/screens/User/flow/profile/appointment_done/appoinmentdone_view_model.dart';
import 'package:saloon_app/screens/User/flow/profile/notification/notification/notification_view.dart';
import 'package:saloon_app/screens/User/flow/profile/rate/rate_view.dart';
import 'package:saloon_app/screens/User/flow/profile/rate/rate_view_model.dart';
import '../../../../../components/custom/custom_btn.dart';

class BookingSuccessPage extends StatefulWidget {
  const BookingSuccessPage({super.key});

  @override
  BookingSuccessPageState createState() => BookingSuccessPageState();
}

class BookingSuccessPageState extends State<BookingSuccessPage> {
  late BookingSuccessViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BookingSuccessViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookingSuccessViewModel>(
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
            ),  const SizedBox(height: 20, width: 5),
          BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
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
                    'Successfully got your',
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
                  /*
                  Image.asset(
                    'assets/images/qr.png',
                    width: 250,
                    height: 250,
                  ),*/
                  buildDetailRow('Customer name', 'Alveera Aliba'),
              buildDetailRow('Service name', 'Pro Hair Cut'),
              buildDetailRow('Price', '50 USD'),
              buildDetailRow('Appointment time', '8.30 am - 9.30 am'),
              buildDetailRow('Appointment date', '2024 April 14'),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  const Text(
                    'Order Reference',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  Consumer<BookingSuccessViewModel>(
                    builder: (context, viewModel, _) {
                      return Text(
                        viewModel.orderReference ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: viewModel.downloadReceipt,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Download Receipt'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: CustomButton(
                      text: 'HOME',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ChangeNotifierProvider(
                          create: (_) =>
                              RateWorkerViewModel(), // Ensure the correct provider is initialized
                          child: RateWorkerPopup(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xBFFF4011)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 5),
                        Text('Rate Saloon'),
                      ],
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
