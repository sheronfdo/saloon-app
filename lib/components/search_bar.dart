import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3182CE),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFF6F6F6),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search services',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          //search icon
          IconButton(
            icon: const Icon(
              IconlyLight.search,
              color: Color(0xFFBF4011),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
