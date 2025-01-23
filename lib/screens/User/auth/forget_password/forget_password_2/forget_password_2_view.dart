import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/components/custom/custom_pd_field.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_2/forget_password_2_viewmodel.dart';
import 'package:saloon_app/themes/app_styles.dart';

class ForgetPassword2View extends StatefulWidget {
  final String userType;
  const ForgetPassword2View({super.key, required this.userType});

  @override
  ForgetPassword2State createState() => ForgetPassword2State();
}

class ForgetPassword2State extends State<ForgetPassword2View> {
  late ForgetPassword2ViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ForgetPassword2ViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgetPassword2ViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.onBackButtonPressed(context, widget.userType);
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
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/logo_qatar.jpeg',
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'RESET PASSWORD',
                      style: AppStyles.mainHeading.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Successfully verified that\'s you!',
                      style: AppStyles.subheading,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Remember Credentials",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 89, 88, 88),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Password input
                    CustomPasswordField(
                      label: 'Password',
                      controller: viewModel.passwordController,
                    ),
                    const SizedBox(height: 30),

                    CustomPasswordField(
                      label: 'Re-Enter Password',
                      controller: viewModel.confirmPasswordController,
                    ),
                    const SizedBox(height: 50),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your password must have:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111111),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF4CAF50),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '8 to 20 characters',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6F6F6F),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF4CAF50),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Letters, numbers and special characters',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF6F6F6F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Submit button
                    CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        // viewModel.resetPassword();
                      },
                    ),
                    const SizedBox(height: 80),
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
