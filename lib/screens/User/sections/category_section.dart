import 'package:flutter/material.dart';
import 'package:saloon_app/screens/User/flow/service/service_view.dart';
import 'package:saloon_app/screens/User/flow/shop/shop_view.dart';
import 'package:saloon_app/services/admin/flow/service/addCategory/add_category_service.dart';
import 'package:saloon_app/services/admin/flow/service/category/category_service.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryService categoryService = CategoryService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServiceView()),
                );
              },
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBF4011),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: AddCategoryService().collectGeneralCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found.'));
              }

              final categories = snapshot.data!;
              return ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((category) {
                  return CategoryCard(
                    title: category['name'],
                    icon: CategoryService().getIcon(category['icon']),
                    backgroundColor: Color(int.parse(category['color'])),
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>   ShopView(serviceId: category['id'] as String ,
                                serviceName:category['name'] as String
                            )),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;


  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120, // Adjust width as needed
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.white),
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
