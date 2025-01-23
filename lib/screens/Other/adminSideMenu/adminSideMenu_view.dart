import 'package:flutter/material.dart';
import 'package:saloon_app/screens/Other/adminSideMenu/adminSideMenu_ViewModel.dart';

class AdminSideMenuView extends StatelessWidget {
  const AdminSideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AdminSideMenuViewModel();

    return Scaffold(
      backgroundColor: const Color(0xFFFFDADA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Close Button
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Close the side menu
                    },
                  ),
                ],
              ),
            ),

            // Profile Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/salon photo.png'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'ABC Saloon',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.circle, size: 10, color: Colors.green),
                            SizedBox(width: 4),
                            Text(
                              'Active',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: viewModel.getMenuItems(context).map((menuItem) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: menuItem.onTap,
                      child: Row(
                        children: [
                          Icon(menuItem.icon,
                              size: 24, color: const Color(0xFF842400)),
                          const SizedBox(width: 20),
                          Text(
                            menuItem.title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF842400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
