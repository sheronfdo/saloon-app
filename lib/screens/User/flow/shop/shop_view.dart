import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/notifications/notification_view.dart';
import 'package:saloon_app/screens/User/flow/shop/shop_viewmodel.dart';
import '../../../../components/custom/custom_bottomNavBar.dart';
import '../../../../components/salon_card.dart';
import '../../../../data/saloon_data.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  ShopState createState() => ShopState();
}

class ShopState extends State<ShopView> {
  late ShopViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ShopViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShopViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFDF5F5),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 260,
                height: 270,
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
                width: 240,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 222, 222),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(130),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/icons/sisor.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black),
                        onPressed: () {},
                      ),
                      //const SizedBox(height: 50),
                      const Text(
                        'CUTTING',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications,
                            color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotificationView()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 75),
                //search bar
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchBar(),
                ),
                const SizedBox(height: 40),
                //saloon card
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    itemCount: saloonData.length,
                    itemBuilder: (context, index) {
                      final saloon = saloonData[index];

                      return SaloonCard(
                        imagePath: saloon['imagePath'] as String,
                        name: saloon['name'] as String,
                        address: saloon['address'] as String,
                        rating: saloon['rating'] as double,
                        reviews: saloon['reviews'] as int,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 0,
          onTap: (index) {
            //navigate other screen
          },
        ),
      ),
    );
  }
}
