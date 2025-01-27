import 'package:flutter/material.dart';
import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/components/salon_card.dart';
import 'package:saloon_app/screens/User/flow/notifications/notification_view.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details1/details1_view.dart';
import 'package:saloon_app/services/users/flow/shop/shop_view_service.dart';

class ShopView extends StatefulWidget {
  final String serviceId;
  final String serviceName;

  const ShopView({
    Key? key,
    required this.serviceId,
    required this.serviceName,
  }) : super(key: key);

  @override
  ShopState createState() => ShopState();
}

class ShopState extends State<ShopView> {
  final ShopViewService shopViewService = ShopViewService();
  late final Future<List<Map<String, dynamic>>> saloonsFuture;

  @override
  void initState() {
    super.initState();
    saloonsFuture =
        shopViewService.getSaloonsByCategory(catId: widget.serviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text(
                      widget.serviceName.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 75),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchBar(),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: saloonsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      final saloons = snapshot.data!;
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        itemCount: saloons.length,
                        itemBuilder: (context, index) {
                          final saloon = saloons[index];
                          return SaloonCard(
                            imagePath: saloon['imagePath'] as String,
                            name: saloon['name'] as String,
                            address: saloon['address'] as String,
                            rating: saloon['rating'] as double,
                            reviews: saloon['reviews'] as int,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details1view(
                                          serviceId: widget.serviceId,
                                          saloonId: saloon['id'] as String,
                                          saloonName:saloon['name'] as String,
                                          serviceImagePath:
                                              saloon['imagePath'] as String,
                                          serviceName: saloon['name'] as String,
                                          serviceAddress:
                                              saloon['address'] as String,
                                          serviceRating:
                                              saloon['rating'] as double,
                                          serviceReviews:
                                              saloon['reviews'] as int,
                                        )),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No saloons available.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }
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
          // Handle navigation
        },
      ),
    );
  }
}
