import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'serviceDetails_viewmodel.dart';

class ServiceDetailsView extends StatelessWidget {
  final ServiceDetailsViewModel viewModel = ServiceDetailsViewModel();

  ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header Section
          _buildHeaderSection(context),

          //details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndPrice(),
                  const SizedBox(height: 8),

                  //rating Section
                  _buildRatingSection(),
                  const SizedBox(height: 16),

                  //description Section
                  _buildDescriptionSection(),
                  const SizedBox(height: 24),

                  //booking button
                  CustomButton(
                    text: 'Book An Appointment',
                    onPressed: () {
                      viewModel.onBookAppointmentClick(context);
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),

      //nav bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: viewModel.onBottomNavTap,
      ),
    );
  }

  //header section
  Widget _buildHeaderSection(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.47,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mencutbeard.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: CircleAvatar(
            backgroundColor: const Color(0xFFBF4011),
            child: IconButton(
              icon: const Icon(
                IconlyLight.arrow_left,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  //title
  Widget _buildTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Pro Hair Cut",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text(
            "50 USD",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  //rating section
  Widget _buildRatingSection() {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              IconlyBold.star,
              color: index < 4
                  ? const Color.fromARGB(255, 255, 214, 0)
                  : Colors.grey,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Leave a Rating.",
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 27, 26, 26),
          ),
        ),
      ],
    );
  }

  //description Section
  Widget _buildDescriptionSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Experience precision and style with our professional haircuts. Our skilled barbers combine classic\n techniques with modern trends to create a look that\n suits your personality and lifestyle.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        SizedBox(height: 18),
        Text(
          "Whether you're after a clean fade, textured crop, or traditional cut, we'll enhance your features and ensure\n you leave looking sharp. Enjoy a relaxing scalp\n massage and expert styling tips to maintain your new\n look between visits.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
