// import 'package:flutter/material.dart';

// class SideMenuScreen extends StatelessWidget {
//   const SideMenuScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           const Color.fromARGB(255, 255, 218, 218), // Light pink background
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Section
//             Padding(
//               padding: const EdgeInsets.all(60.0),
//               child: Row(
//                 children: [
//                   // Profile Picture
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage(
//                         'assets/images/profile.png'), // Add your image path here
//                   ),
//                   const SizedBox(width: 16),
//                   // Profile Details
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Alveera Ailba',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Pro Member',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black54,
//                         ),
//                       ),
//                       SizedBox(height: 2),
//                       Row(
//                         children: [
//                           Icon(Icons.circle, size: 10, color: Colors.green),
//                           SizedBox(width: 4),
//                           Text(
//                             'Active',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.green,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   // Close Button
//                   IconButton(
//                     onPressed: () {
//                       //close navigate
//                     },
//                     icon: const Icon(Icons.close, color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Menu Items
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 70.0),
//                 children: const [
//                   MenuItem(
//                     icon: Icons.home,
//                     title: 'Home',
//                   ),
//                   MenuItem(
//                     icon: Icons.bar_chart,
//                     title: 'Saloons',
//                   ),
//                   MenuItem(
//                     icon: Icons.content_paste,
//                     title: 'Services',
//                   ),
//                   MenuItem(
//                     icon: Icons.book_online,
//                     title: 'Bookings',
//                   ),
//                   MenuItem(
//                     icon: Icons.person,
//                     title: 'Profile Settings',
//                   ),
//                   MenuItem(
//                     icon: Icons.logout,
//                     title: 'Logout',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MenuItem extends StatelessWidget {
//   final IconData icon;
//   final String title;

//   const MenuItem({
//     Key? key,
//     required this.icon,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: InkWell(
//         onTap: () {
//           //navigate
//         },
//         child: Row(
//           children: [
//             Icon(icon, color: const Color.fromRGBO(132, 36, 0, 1.0)),
//             const SizedBox(width: 20),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Color.fromRGBO(132, 36, 0, 1.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 218, 218),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Profile Details Below Picture
                 Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Alveera Ailba',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text(
                            'Pro Member',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        
                        children: const [
                          Icon(Icons.circle, size: 10, color: Colors.green),
                          SizedBox(width: 4),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    children: [
                      MenuItem(
                        icon: Icons.home,
                        title: 'Home',
                        onTap: () {
                          print('Home tapped'); // Debug print
                          // Add navigation logic here
                        },
                      ),
                      MenuItem(
                        icon: Icons.bar_chart,
                        title: 'Saloons',
                        onTap: () {
                          print('Saloons tapped');
                        },
                      ),
                      MenuItem(
                        icon: Icons.content_paste,
                        title: 'Services',
                        onTap: () {
                          print('Services tapped');
                        },
                      ),
                      MenuItem(
                        icon: Icons.book_online,
                        title: 'Bookings',
                        onTap: () {
                          print('Bookings tapped');
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: 'Profile Settings',
                        onTap: () {
                          print('Profile Settings tapped');
                        },
                      ),
                      MenuItem(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () {
                          print('Logout tapped');
                          Navigator.pop(context);
                          // Add logout logic here
                        },
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: const Color.fromRGBO(132, 36, 0, 1.0)),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(132, 36, 0, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
