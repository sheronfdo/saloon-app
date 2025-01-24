import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/user/auth/signup/signup_viewmodel.dart';
import 'package:saloon_app/services/users/userAuthService.dart';
import '../../../../components/custom/custom_btn.dart';
import '../../../../components/custom/custom_pd_field.dart';
import '../../../../components/custom/custom_phone_field.dart';
import '../../../../components/custom/custom_txtfield.dart';
import '../../../../themes/app_styles.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  SignUpViewState createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpView> {
  late SignUpViewModel viewModel;

  // Adding controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String selectedCountryCode = "+94";
  String formattedPhone = "";

  @override
  void initState() {
    super.initState();
    viewModel = SignUpViewModel();
    viewModel.init();
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/portrait beautiful young woman with red lips .png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 110.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        'SIGN UP',
                        style: AppStyles.mainHeading.copyWith(fontSize: 34),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Enter your details to create new \naccount',
                        style: AppStyles.subheading,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Name Field
                      CustomTextField(
                        label: 'Name',
                        hintText: 'Enter your username',
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                      ),
                      const SizedBox(height: 15),

                      // Phone Field
                      CustomPhoneField(
                        label: 'Phone Number',
                        phoneController: _phoneController,
                        onPhoneChanged: (phone) {
                          setState(() {
                            selectedCountryCode = phone.dialCode!;
                            formattedPhone = phone.phoneNumber!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      CustomTextField(
                        label: 'Email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      CustomPasswordField(
                        label: 'Password',
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 15),
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
                            'Agree to all terms and conditions',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 124, 122, 122),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Sign Up Button
                      CustomButton(
                        text: 'Sign up',
                        onPressed: () async {
                          if (formattedPhone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please provide a valid phone number."),
                              ),
                            );
                            return;
                          }
                          // Handle sign up action
                          await UserAuthService().signup(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            phone: formattedPhone,
                            context: context,
                            role: 'user',
                          );
                        },
                      ),
                      const SizedBox(height: 24),

                      // Login Now Option
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 89, 88, 88),
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                viewModel.onLogInButtonClick(context);
                              },
                              child: const Text(
                                'Log in Now',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
