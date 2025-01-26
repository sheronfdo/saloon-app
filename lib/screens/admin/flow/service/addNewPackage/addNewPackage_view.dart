import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/admin/flow/service/editeDeletePackage/editeDeletePack_view.dart';
import 'package:saloon_app/screens/admin/flow/service/savePackage/savePackage_view.dart';
import 'package:saloon_app/services/admin/flow/service/package/package_service.dart';
import 'addNewPackage_viewmodel.dart';

class AddNewPackageView extends StatefulWidget {
  final String serviceId;

  const AddNewPackageView({Key? key, required this.serviceId}) : super(key: key);

  @override
  AddNewPackageState createState() => AddNewPackageState();
}

class AddNewPackageState extends State<AddNewPackageView> {
  late AddNewPackageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = AddNewPackageViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        backgroundColor: const Color(0xFFFDF5F5),
        body: Stack(
          children: [
            // Background Design
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
              left: 2,
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

            // Content Section
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
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'CUTTINGS',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Color.fromARGB(255, 187, 8, 8)),
                        onPressed: () {
                          //add delete functionality here
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'You can add new packages and edit packages here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Package Cards
                Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: PackageService().collectUserCategoryPackages(catId: widget.serviceId), // Fetch data
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No packages found.'));
                      } else {
                        final packages = snapshot.data!;
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          itemCount: packages.length,
                          itemBuilder: (context, index) {
                            final package = packages[index];
                            return PackageCard(
                              title: package['title'],
                              price: package['price'],
                              imagePath: package['imagePath'],
                              isDeactivated: package['isDeactivated'],
                              serviceId: widget.serviceId, // Pass the serviceId from AddNewPackageView
                              onPressed: () {
                                // Print all package details when a card is clicked
                                print('Show Package card---------------------------------------------------------------------------');
                                print('Package ID: ${package['id']}');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditeDeletePackageView(
                                      serviceId: widget.serviceId, // Pass the serviceId
                                      packageId: package['id'], // Pass the packageId dynamically
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),

                //add New Package Button
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //add new package functionality
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SavePackageView(
                              serviceId: widget.serviceId, // Pass the serviceId
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF842400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Add new Packages',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final bool isDeactivated;
  final VoidCallback onPressed;
  final String serviceId ;

  const PackageCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imagePath,
    this.isDeactivated = false,
    required this.onPressed,
    required this.serviceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: isDeactivated
                          ? Colors.black45
                          : const Color(0xFF842400),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: isDeactivated ? Colors.black38 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            if (isDeactivated)
              const Text(
                'Deactivated',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
