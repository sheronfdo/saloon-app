import 'package:flutter/material.dart';

class AdminProfileCard extends StatelessWidget {
  const AdminProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFDBF47),
                    width: 3,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/salon photo.png'),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ABC  Saloons',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 15,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'AB, ABC Street, Middle East, UAE, Dubai',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                //SizedBox(height: 5),
                Row(
                  children: [
                    // Icon(Icons.circle, size: 12, color: Colors.green),
                    // SizedBox(width: 10),
                    Text(
                      'Pro Saloon',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        //color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.99 (241)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 107, 105, 105),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
