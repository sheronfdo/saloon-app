import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/components/salon_detailsCard.dart';
import 'package:saloon_app/screens/Other/userSidemenu/userSidemunu_view.dart';
import 'package:saloon_app/screens/User/flow/saloonDetails/details1/details1_viewmodel.dart';
import 'package:saloon_app/screens/User/flow/serviceDetails/serviceDetails_view.dart';
import 'package:saloon_app/services/users/flow/shop/shop_view_service.dart';

class Details1view extends StatefulWidget {
  final String serviceId;
  final String saloonId;
  final String saloonName;
  final String serviceName;
  final String serviceAddress;
  final double serviceRating;
  final int serviceReviews;
  final String serviceImagePath;

  const Details1view({
    Key? key,
    required this.serviceId,
    required this.saloonId,
    required this.serviceName,
    required this.saloonName,
    required this.serviceAddress,
    required this.serviceRating,
    required this.serviceReviews,
    required this.serviceImagePath,
  }) : super(key: key);

  @override
  State<Details1view> createState() => _Details1viewState();
}

class _Details1viewState extends State<Details1view> {
  List<Map<String, dynamic>> saloonDetailsData = [];

  @override
  void initState() {
    super.initState();
    _fetchShopPackages();
  }

  void _fetchShopPackages() async {
    List<Map<String, dynamic>> data = await ShopViewService()
        .getSaloonsPackagesByCategory(
            saloonId: widget.saloonId, catId: widget.serviceId);
    setState(() {
      saloonDetailsData = data;
    });
  }

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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.serviceImagePath),
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
                      Text(
                        widget.serviceName,
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
                          Text(
                            (widget.serviceRating as double).toString() +
                                '/5 (' +
                                (widget.serviceReviews as int).toString() +
                                ')',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.serviceAddress,
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
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceDetailsView(
                        packageID:  service['id'],
                        serviceId:widget.serviceId,
                        saloonId:widget.saloonId,
                        saloonName:widget.saloonName,
                        imageUrl: service['imagePath'],
                        ptitle: service['name'],
                        description: service['description'],
                        rating: service['rating'],
                        price: service['price'],
                      )),
                    );
                      },
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
