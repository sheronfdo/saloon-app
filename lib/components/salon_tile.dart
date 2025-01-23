import 'package:flutter/material.dart';

class SalonTile extends StatelessWidget {
  final String image;
  final String label;

  const SalonTile({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image, height: 80, fit: BoxFit.cover),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
