import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/profile/edit_profile/edit_profile_viewmodel.dart';
import '../../../../../components/custom/customappbar.dart';
import '../../../../../themes/app_colors.dart';
import '../../../../../themes/app_styles.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfileView> {
  late EditProfileViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = EditProfileViewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditProfileViewmodel(),
      child: Scaffold(
        body: Stack(children: [
          // Positioned widget to place the background container
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 240,
              height: 210,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 237, 237),
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
              width: 220,
              height: 190,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 253, 212, 212),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(130),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBarWithArrow(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        "EDIT PROFILE",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.7,
                          color: Color(0xFF524B4B),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Name Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name", style: AppStyles.fieldName),

                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Enter your name",
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Email Field
                        const Text("Email", style: AppStyles.fieldName),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Enter your email",
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Mobile Field
                        const Text("Mobile", style: AppStyles.fieldName),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Enter your number",
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Address Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Addresses", style: AppStyles.fieldName),
                            TextButton(
                              onPressed: () {
                                // Add new address action
                              },
                              child: const Text("Add new",
                                  style: AppStyles.linkText),
                            ),
                          ],
                        ),
                        // Use Column instead of ListView
                        Column(
                          children: [
                            _buildAddressTile(
                                "HOME", "ABC, L Road, New York, United State"),
                            _buildAddressTile("Office",
                                "ABC, L Road, New York, United State"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Update Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 90,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Update action
                        },
                        child:
                            const Text("Update", style: AppStyles.buttonText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildAddressTile(String title, String address) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.fieldName),
                const SizedBox(height: 4),
                Text(address, style: AppStyles.subheading),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.drive_file_rename_outline, color: AppColors.gray),
                  onPressed: () {
                    // Edit address action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: AppColors.gray),
                  onPressed: () {
                    // Delete address action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
