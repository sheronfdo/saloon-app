import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/components/custom/custom_pd_field.dart';
import 'package:saloon_app/components/custom/custom_txtfield.dart';
import 'package:saloon_app/screens/admin/login/admin_login_viewmodel.dart';
import 'package:saloon_app/themes/app_styles.dart';

class AdminLoginView extends StatefulWidget {
  const AdminLoginView({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<AdminLoginView> {
  late AdminLoginViewModel viewModel;

  // Adding controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = AdminLoginViewModel();
    viewModel.init();
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminLoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.onBackButtonPressed(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/adminloginscreen image.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // logo
                  Image.asset(
                    'assets/images/logo_qatar.jpeg',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'LOG IN',
                    style: AppStyles.mainHeading.copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Enter your saloon\'s email and password to log in',
                    style: AppStyles.subheading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Email TextField
                  CustomTextField(
                    label: 'Email or mobile number',
                    hintText: 'Enter your email or mobile number',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),

                  // Password TextField
                  CustomPasswordField(
                    label: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 15),

                  // Remember me & Forget Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Switch(
                            value: viewModel.toggledOn,
                            onChanged: (value) {
                              setState(() {
                                viewModel.onToggleClick(value);
                              });
                            },
                            activeTrackColor:
                                const Color.fromARGB(255, 177, 58, 15),
                            inactiveTrackColor: const Color(0xFFE0E0E0),
                            activeColor: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 124, 122, 122),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.onForgetPasswordClick(context);
                        },
                        child: const Text('Forget Password',
                            style: AppStyles.linkText),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Login Button
                  CustomButton(
                    text: 'Log In',
                    onPressed: () {
                      viewModel.onLogInButtonClick(context);
                    },
                  ),
                  const SizedBox(height: 24),

                  const Center(
                    child: SizedBox(
                      width: 340,
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFA4A4A4),
                        height: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sign Up Section
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 89, 88, 88),
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            viewModel.onSignUpButtonClick(context);
                          },
                          child: const Text(
                            'Sign Up Now',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFBF4011),
                            ),
                          ),
                        ),
                      ],
                    ),
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
