import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/User/flow/profile/privacy/privacy_viewmodel.dart';
import '../../../../../components/custom/new-custom-app-bar.dart';
import '../../../../../themes/app_styles.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  PrivacyState createState() => PrivacyState();
}

class PrivacyState extends State<PrivacyView> {
  late PrivacyViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PrivacyViewmodel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrivacyViewmodel(),
      child: Scaffold(
        body: Stack(
          children: [
            // Background Decorations
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
            // Custom App Bar
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:
                  NewCustomAppBar(), // Ensure the custom app bar widget is defined
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 60), // Space below the app bar
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // Centered Page Title
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Text(
                            "PRIVACY & POLICY",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.7,
                              color: Color(0xFF524B4B),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Privacy Policy Sections
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildSection(
                            "1. Types of data we collect",
                            "Services",
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
                          ),
                          _buildSection(
                            "2. Use of your personal data",
                            null,
                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
                          ),
                          _buildSection(
                            "3. Disclosure of your personal data",
                            null,
                            "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String? subtitle, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.fieldName
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppStyles.fieldName
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            content,
            style: AppStyles.subheading.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
