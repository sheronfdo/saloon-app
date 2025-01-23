import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/screens/User/flow/saloon/bio/bioDetails_viewmodel.dart';

class BioDetailsView extends StatefulWidget {
  const BioDetailsView({super.key});

  @override
  State<BioDetailsView> createState() => _BioDetailsViewState();
}

class _BioDetailsViewState extends State<BioDetailsView> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BioDetailsViewModel(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            children: [
              //header section
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(34),
                      bottomRight: Radius.circular(34),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _currentTabIndex == 0
                          ? MediaQuery.of(context).size.height * 0.5
                          : MediaQuery.of(context).size.height * 0.3,
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
                          Provider.of<BioDetailsViewModel>(context,
                                  listen: false)
                              .navigateBack(context);
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
                          'Saloon ABC (Men)',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
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
                                fontSize: 12,
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

              //tab bar Section
              TabBar(
                indicatorColor: const Color(0xFFBF4011),
                indicatorWeight: 2.5,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                onTap: (index) {
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
                tabs: const [
                  Tab(text: 'Bio'),
                  Tab(text: 'Services'),
                  Tab(text: 'Ratings'),
                  Tab(text: 'Media'),
                ],
              ),

              // Content Section
              Expanded(
                child: TabBarView(
                  children: [
                    //bio
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'I take great pride in my work, and I love seeing my clients smile when they see their finished look! I have been in the beauty industry for over 20 years, and have enjoyed every minute of it. My goal as a Cosmetologist is to provide an environment where my clients can sit back and feel relaxed while being pampered.',
                              style: const TextStyle(
                                fontSize: 15,
                                //fontFamily: 'Rubik',
                                color: Colors.black87,
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Opening hours',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Monday - Friday',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '8:30 am - 9:00 pm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Saturday - Sunday',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '9:00 am - 10:00 pm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //service Section
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GridView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
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
                                final service =
                                    services[index % services.length];

                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const ShopView(),
                                    //   ),
                                    // );
                                    print("hello");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: service['color'] as Color,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Ratings Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      IconlyBold.star,
                                      color: index < 4
                                          ? const Color.fromARGB(
                                              255, 255, 214, 0)
                                          : Colors.grey,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            //average Rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '4.8/5 ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '(319)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            // Customer Ratings Header
                            const Text(
                              'Customer Ratings (319)',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            // Customer Reviews List
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 3,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              ),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Name 01',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(
                                              Icons.star,
                                              color: index < 4
                                                  ? const Color.fromARGB(
                                                      255, 255, 214, 0)
                                                  : Colors.grey,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    //service Type
                                    const Text(
                                      'Service',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    //customer Review
                                    const Text(
                                      'I take great pride in my work, and I love seeing my clients smile when they see their finished look! I have been in the beauty industry for over 20 years.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Media Section
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //const SizedBox(height: 2),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                              ),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 220, 220, 220),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //bottom nav bar
          bottomNavigationBar: Consumer<BioDetailsViewModel>(
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
      ),
    );
  }
}
