import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/Other/adminSideMenu/adminSideMenu_view.dart';
import 'package:saloon_app/screens/admin/flow/service/addCategory/addCategory_view.dart';
import 'package:saloon_app/screens/admin/flow/notifications/notification_view.dart';
import 'package:saloon_app/screens/admin/flow/service/addNewPackage/addNewPackage_view.dart';

class ServiceCategoryView extends StatefulWidget {
  const ServiceCategoryView({super.key});

  @override
  State<ServiceCategoryView> createState() => _ServiceCategoryViewState();
}

class _ServiceCategoryViewState extends State<ServiceCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    _buildHeader(context),
                    const SizedBox(height: 20),
                    _buildTitle(),
                    const SizedBox(height: 30),
                    const Text(
                      '   Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '   You can add new services and edit inside the categories.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildServiceGrid(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Background decorations
  Widget _buildBackground() {
    return Stack(
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
          ),
        ),
      ],
    );
  }

  // Header
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            print('admin side menu');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminSideMenuView(),
              ),
            );
          },
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(IconlyBold.notification,
                  color: Color(0xFFB3B3B3), size: 28),
              onPressed: () {
                // Notification action
                print('notification menu');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationView(),
                  ),
                );
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Title
  Widget _buildTitle() {
    return const Center(
      child: Text(
        'My Services',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Service Grid
  Widget _buildServiceGrid(BuildContext context) {
    final services = [
      {
        'icon': Icons.content_cut,
        'label': 'Cutting',
        'color': const Color(0xFFF5A369)
      },
      {'icon': Icons.spa, 'label': 'Shaving', 'color': const Color(0xFFFA6199)},
      {'icon': Icons.face, 'label': 'Facial', 'color': const Color(0xFF792242)},
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: services.length + 1,
      itemBuilder: (context, index) {
        if (index < services.length) {
          final service = services[index % services.length];
          return GestureDetector(
            onTap: () {
              print("Service tapped: ${service['label']}");
            },
            child: Container(
              decoration: BoxDecoration(
                color: service['color'] as Color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(service['icon'] as IconData,
                      size: 40, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    service['label'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              print("Add new category");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewCategoryView(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}
