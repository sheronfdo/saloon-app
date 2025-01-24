import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/notifications/notification_view.dart';
import 'package:saloon_app/screens/user/flow/service/service_viewmodel.dart';
import 'package:saloon_app/screens/user/flow/shop/shop_view.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  ServiceState createState() => ServiceState();
}

class ServiceState extends State<ServiceView> {
  late ServiceViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceViewModel(),
      child: Scaffold(
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
                      const Text(
                        'SERVICES',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchBar(),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      final services = [
                        {
                          'icon': Icons.content_cut,
                          'label': 'Cutting',
                          'color': const Color(0xFFF5A369)
                        },
                        {
                          'icon': Icons.spa,
                          'label': 'Shaving',
                          'color': const Color(0xFFFA6199)
                        },
                        {
                          'icon': Icons.face,
                          'label': 'Facial',
                          'color': const Color(0xFF792242)
                        },
                      ];
                      final service = services[index % services.length];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopView()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: service['color'] as Color,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: index == 1
                                  ? const Color.fromARGB(255, 145, 164, 182)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(service['icon'] as IconData,
                                  size: 40, color: Colors.white),
                              const SizedBox(height: 8),
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
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.expand_less,
                            size: 24, color: Colors.black54),
                        Icon(Icons.expand_less,
                            size: 24, color: Colors.black54),
                      ],
                    ),
                    const Text(
                      'Swipe up for more Jobs',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(137, 4, 4, 4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    BottomNavigationBar(
                      selectedItemColor: const Color(0xFFBF4011),
                      unselectedItemColor: Colors.black54,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'HOME',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.access_time),
                          label: 'JOBS',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'PROFILE',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
