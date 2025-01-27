import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/components/salon_detailsCard.dart';
import 'package:saloon_app/data/saloon_details.dart';
import 'package:saloon_app/screens/Other/userSidemenu/userSidemunu_view.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details1/details1_viewmodel.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details2/details2_view.dart';

class Details1view extends StatelessWidget {

  final String serviceId;
  final String serviceName;
  final String serviceAddress;
  final double serviceRating;
  final int serviceReviews;
  final String serviceImagePath;
  const Details1view({
    Key? key,
    required this.serviceId,
    required this.serviceName,
    required this.serviceAddress,
    required this.serviceRating,
    required this.serviceReviews,
    required this.serviceImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Details1ViewModel(),
      child: Scaffold(
        body: Column(
          children: [
            // Header Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/The man cuts his beard in the barbershop.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFBF4011),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserSideMenuView()),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saloon ABC',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < 4
                                    ? const Color.fromARGB(255, 255, 214, 0)
                                    : Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '4.8/5 (319)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'ABC House, 3rd Street, UAE, Dubai',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // List Card Section
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                itemCount: saloonDetailsData.length,
                itemBuilder: (context, index) {
                  final service = saloonDetailsData[index];
                  return SaloonDetailsCard(
                    imageUrl: service['imagePath'],
                    title: service['name'],
                    description: service['description'],
                    rating: service['rating'],
                    reviews: service['reviews'],
                    price: service['price'],
                  );
                },
              ),
            ),
          ],
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: Consumer<Details1ViewModel>(
          builder: (context, viewModel, child) {
            return CustomBottomNavBar(
              currentIndex: 0,
              onTap: (index) {
                viewModel.onBottomNavTap(index);
              },
            );
          },
        ),
      ),
    );
  }
}
