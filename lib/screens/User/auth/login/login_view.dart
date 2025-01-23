import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/components/custom/custom_pd_field.dart';
import 'package:saloon_app/components/custom/custom_txtfield.dart';
import 'package:saloon_app/screens/user/auth/login/login_viewmodel.dart';
import 'package:saloon_app/services/auth_service.dart';
import 'package:saloon_app/themes/app_styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginView> {
  late LoginViewModel viewModel;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
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
                opacity: 0.1,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Portrait of handsome looking man.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/logo_qatar.jpeg',
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 50),

                    // Title
                    Text(
                      'LOG IN',
                      style: AppStyles.mainHeading.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Enter your email and password to log in',
                      style: AppStyles.subheading,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email TextField
                    CustomTextField(
                      label: 'Email or mobile number',
                      hintText: 'Enter your email or mobile number',
                      controller: _emailController,
                    ),
                    const SizedBox(height: 18),

                    // Password TextField
                    CustomPasswordField(
                      label: 'Password',
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 18),

                    // Remember me & Forget password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Switch(
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
                    const SizedBox(height: 22),

                    // Login Button
                    CustomButton(
                      text: 'Log In',
                      onPressed: () async {
                        AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                        );
                      },
                    ),

                    const SizedBox(height: 26),

                    // Divider
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
                    // Social Media Login
                    const SizedBox(height: 18),
                    const Center(
                        child: Text('Login using social media',
                            style: AppStyles.subheading)),
                    const SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {
                    //         print('Google button tapped');
                    //       },
                    //       child: Image.asset(
                    //         'assets/images/icons/google_icon.png',
                    //         height: 50,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 16),
                    //     GestureDetector(
                    //       onTap: () {
                    //         print('Apple button tapped');
                    //       },
                    //       child: Image.asset(
                    //         'assets/images/icons/apple_icon.png',
                    //         height: 50,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 16),
                    //     GestureDetector(
                    //       onTap: () {
                    //         print('Facebook button tapped');
                    //       },
                    //       child: Image.asset(
                    //         'assets/images/icons/facebook_icon.png',
                    //         height: 50,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 40),
                    // Sign Up
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
                          const SizedBox(height: 30),
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
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
