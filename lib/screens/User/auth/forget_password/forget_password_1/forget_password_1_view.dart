import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_btn.dart';
import 'package:saloon_app/components/custom/custom_phone_field.dart';
import 'package:saloon_app/components/custom/custom_txtfield.dart';
import 'package:saloon_app/screens/User/auth/forget_password/forget_password_1/forget_password_1_viewmodel.dart';
import 'package:saloon_app/themes/app_styles.dart';

class ForgetPassword1View extends StatefulWidget {
  final String userType;
  const ForgetPassword1View({super.key, required this.userType});

  @override
  ForgetPassword1State createState() => ForgetPassword1State();
}

class ForgetPassword1State extends State<ForgetPassword1View> {
  late ForgetPassword1ViewModel viewModel;

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = ForgetPassword1ViewModel();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgetPassword1ViewModel(),
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
                    const SizedBox(height: 60),
                    Text(
                      'RESET PASSWORD',
                      style: AppStyles.mainHeading.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Enter your email to reset your password',
                      style: AppStyles.subheading,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),

                    const CustomTextField(
                        label: 'Email', hintText: 'Enter your email address'),
                    const SizedBox(height: 50),

                    // CustomPhoneField(
                    //   phoneController: _phoneNumberController,
                    //   label: "Email Address",
                    // ),
                    // const SizedBox(height: 50),

                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'OR',
                            style: AppStyles.subheading,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Text(
                            //   'Enter Email',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.normal,
                            //     color: Color.fromARGB(255, 111, 109, 109),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Submit Button
                    CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        viewModel.onSubmitButtonClick(context, widget.userType);
                      },
                    ),
                    const SizedBox(height: 150),

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
                    const SizedBox(height: 20),

                    // Sign Up Option
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Remember Credentials ?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 89, 88, 88),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              viewModel.onLogInButtonClick(
                                  context, widget.userType);
                            },
                            child: const Text(
                              'Login in Now',
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
          ],
        ),
      ),
    );
  }
}
