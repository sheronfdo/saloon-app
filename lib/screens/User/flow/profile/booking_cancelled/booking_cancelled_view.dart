import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/new-custom-app-bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloon_app/screens/User/flow/bookings/saloon_Location/saloon_location_view.dart';
import 'package:saloon_app/screens/User/flow/profile/booking_cancelled/booking_cancelled_view_model.dart';

class BookingCancelledView extends StatefulWidget {
  const BookingCancelledView({super.key});

  @override
  BookingCancelledViewState createState() => BookingCancelledViewState();
}

class BookingCancelledViewState extends State<BookingCancelledView> {
  late BookingCancelledViewmodel viewModel;
  bool isNotificationOn = true;

  @override
  void initState() {
    super.initState();
    viewModel = BookingCancelledViewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingCancelledViewmodel(),
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
                  color: Color.fromARGB(255, 255, 237, 237),
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
                  color: Color.fromARGB(255, 253, 212, 212),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(130),
                  ),
                ),
              ),
            ),
             const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NewCustomAppBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Center(
                          child: Text(
                            "BOOKINGS",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.7,
                              color: Color(0xFF524B4B),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Booking Status
                        Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5EFFF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(Icons.circle, color: Colors.red, size: 12),
                          SizedBox(width: 8),
                          Text(
                            'Cancelled by the saloon',
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            ),
                          ),
                          ],
                        ),
                        ),
                      SizedBox(height: 17),
                      // Booking Details
                      Text(
                        'Pro Hair Cut',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          'Monday, 28 Oct',
                          style: TextStyle(
                            color: Color(0xFF79280A),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                            'AED 220.00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            ),
                          ],
                          ),
                        
                          Row(
                          children: [
                            Icon(Icons.access_time),
                            Text(
                            ' 8:00 am - 11:00 am',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                          ),
                         
                          
                        ],
                        ),
                      SizedBox(height: 16),
                      Text('Saloon Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                      // Saloon Details Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/salon-section.png', // Replace with your image asset
                                      height: 80,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 18),
                                  // Saloon Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Saloon Abimantra',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF3D0017),
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            Text(
                                              'ABS Road, City, Dubai',
                                              style: TextStyle(color: Color(0xFF9E6279)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: Colors.orange, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              '4.8/5 (319)',
                                              style: TextStyle(color: Color(0xFF9E6279)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.call, color: Color(0xFFBF4011)),
                                  Icon(Icons.message, color: Color(0xFFBF4011)),
                                  Icon(FontAwesomeIcons.whatsapp, color: Color(0xFFBF4011)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Buttons
                        ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=> SaloonLocationView()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFBF4011),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: Size(double.infinity, 0), // Set the button to full width
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on),
                             Text('Saloon Location', style: TextStyle(fontSize: 16)),
                          ],
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
    );
  }
}