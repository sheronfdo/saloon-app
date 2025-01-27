import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/components/custom/custom_bottomNavBar.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/screens/User/flow/appoinment/appoinment_1/appoinment_1_view.dart';
import 'serviceDetails_viewmodel.dart';

class ServiceDetailsView extends StatelessWidget {
  final String serviceID;
  final String imageUrl;
  final String ptitle;
  final String description;
  final double rating;
  final String price;
  final ServiceDetailsViewModel viewModel = ServiceDetailsViewModel();

  ServiceDetailsView({
    super.key,
    required this.serviceID,
    required this.imageUrl,
    required this.ptitle,
    required this.description,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          _buildHeaderSection(context),

          // Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndPrice(),
                  const SizedBox(height: 8),

                  // Rating Section
                  _buildRatingSection(),
                  const SizedBox(height: 16),

                  // Description Section
                  _buildDescriptionSection(),
                  const SizedBox(height: 24),

                  // Booking Button
                  CustomButton(
                    text: 'Book An Appointment',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Appoinment1View()),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),

      // Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: viewModel.onBottomNavTap,
      ),
    );
  }

  // Header Section
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
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

  // Title and Price
  Widget _buildTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ptitle,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '$price USD',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Rating Section
  Widget _buildRatingSection() {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
                (index) => Icon(
              IconlyBold.star,
              color: index < rating
                  ? const Color.fromARGB(255, 255, 214, 0)
                  : Colors.grey,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$rating / 5.0',
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  // Description Section
  Widget _buildDescriptionSection() {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }
}
