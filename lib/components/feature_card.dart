import 'package:flutter/material.dart';

class FeatureCardSection extends StatelessWidget {
  const FeatureCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryCard(
                title: 'Bookings',
                imagePath: 'assets/images/Calendar.png',
                backgroundColor: Color.fromARGB(255, 121, 40, 10),
              ),
              CategoryCard(
                title: 'Services',
                imagePath: 'assets/images/Settings.png',
                backgroundColor: Color.fromARGB(255, 121, 40, 10),
              ),
              CategoryCard(
                title: 'Products',
                imagePath: 'assets/images/Skincare.png',
                backgroundColor: Color.fromARGB(255, 121, 40, 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 112,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 30, width: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
