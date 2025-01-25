import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/components/custom/custom_image_uploader.dart';
import 'package:saloon_app/components/custom/custom_pd_field.dart';
import 'package:saloon_app/screens/admin/registration/admin_signup_viewmodel.dart';
import 'package:saloon_app/services/admin/admin_authService.dart';
import '../../../components/custom/custom_btn.dart';
import '../../../components/custom/custom_phone_field.dart';
import '../../../components/custom/custom_txtfield.dart';
import '../../../themes/app_styles.dart';
import 'package:pinput/pinput.dart';

class AdminSignUpView extends StatefulWidget {
  const AdminSignUpView({super.key});

  @override
  AdminSignUpViewState createState() => AdminSignUpViewState();
}

class AdminSignUpViewState extends State<AdminSignUpView> {
  late AdminSignUpViewModel viewModel;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  //controllers
  final TextEditingController _saloonNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _registrationNoController =
      TextEditingController();
  final TextEditingController _personInChargeController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController =
      TextEditingController();
  final TextEditingController _workingDaysController = TextEditingController();
  final TextEditingController _workingHoursController = TextEditingController();

  String crImageUrl = '';
  String profilePhotoUrl = '';

  String selectedCountryCode = "+94";
  String formattedPhone = "";

  int initialSeconds = 59;
  final GlobalKey<CountdownTimerState> _countdownTimerKey =
      GlobalKey<CountdownTimerState>();

  @override
  void initState() {
    super.initState();
    viewModel = AdminSignUpViewModel();
    viewModel.init(_pageController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _saloonNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _otpController.dispose();
    _registrationNoController.dispose();
    _personInChargeController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    _workingDaysController.dispose();
    _workingHoursController.dispose();
    super.dispose();
  }

  void _onNextButtonPressed() async {
    await AdminAuthService().registerAdminStep1(
      saloonName: _saloonNameController.text.trim(),
      phone: "$selectedCountryCode${_phoneController.text.trim()}",
      email: _emailController.text.trim(),
      address: _addressController.text.trim(),
      role: 'admin', // Assuming the role is 'admin'
      context: context,
    );

    if (_currentPage < 7) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      _countdownTimerKey.currentState?.resetTimer();
    }
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminSignUpViewModel(),
      child: Scaffold(
        appBar: _currentPage != 0
            ? AppBar(
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.onBackButtonPressed(context);
                  },
                ),
                actions: [
                  (_currentPage == 5 || _currentPage == 4)
                      ? TextButton(
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        )
                      : (Container()),
                ],
              )
            : null,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      buildRegistrationPage(),
                      buildOTPVerifyPage(),
                      buildBusinessDocsPage(),
                      buildSetPasswordPage(),
                      buildAddAvailabilityPage(),
                      buildAddProfileImagePage(),
                      buildRegistrationSuccessPage(),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(7, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: 8,
                          height: 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? const Color(0xFF3A3A3A)
                                : const Color(0xFFC9C9C9),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegistrationPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'REGISTRATION',
            style: AppStyles.mainHeading.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Enter saloon details to create new account',
            style: AppStyles.subheading,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          CustomTextField(
            label: 'Saloon Name',
            hintText: 'Enter saloon name',
            keyboardType: TextInputType.name,
            controller:_saloonNameController,
          ),
          const SizedBox(height: 15),
          CustomPhoneField(
            onPhoneChanged: (phone) {},
            controller:_phoneController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            controller:_emailController ,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            label: 'Address',
            hintText: 'Select on map',
            keyboardType: TextInputType.name,
            suffixIcon: Icons.location_on,
            controller:_addressController,
          ),
          const SizedBox(height: 40),
          CustomButton(
            text: 'Next',
            onPressed: _onNextButtonPressed,
          ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Already have a saloon account ?",
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
    );
  }

  Widget buildOTPVerifyPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter 6-Digit Code',
            style: AppStyles.mainHeading.copyWith(fontSize: 22),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Text(
            '4-digit One-time password has been sent to your phone number and email',
            style: AppStyles.subheading,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 50),

          // Pinput for OTP input
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Pinput(
              length: 6,
              autofocus: true,
              pinAnimationType: PinAnimationType.fade,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF3182CE), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                // Handle OTP value change if necessary
                print(value); // You can replace this with your actual logic
              },
              onCompleted: (value) {
                // This gets called when all OTP digits are entered
                print("OTP completed: $value");
              },
            ),
          ),

          SizedBox(height: 30),

          // Resend code timer
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Resend code:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 124, 122, 122),
                ),
              ),
              SizedBox(width: 5),
              CountdownTimer(
                key: _countdownTimerKey,
                initialSeconds: 59,
              ),
            ],
          ),

          Spacer(),

          // Verify button
          CustomButton(
            text: 'Verify',
            onPressed: _onNextButtonPressed,
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildBusinessDocsPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registration  Documents',
            style: AppStyles.mainHeading.copyWith(fontSize: 22),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Text(
            'Enter your saloon registration documents',
            style: AppStyles.subheading,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 30),
          CustomTextField(
              controller: _registrationNoController,
              label: 'Registration No',
              hintText: '123456'),
          SizedBox(height: 15),
          CustomTextField(
              controller: _personInChargeController,
              label: 'Person in charge',
              hintText: 'Enter Name'),
          SizedBox(height: 15),
          CustomImagePicker(
            label: 'CR Copy',
            onImageSelected: (imageFile) {
              setState(() {});
              if (imageFile != null) {
                print('Selected Image Path: ${imageFile.path}');
              } else {
                print('No image selected');
              }
            },
          ),
          Spacer(),
          CustomButton(
            text: 'Next',
            onPressed: _onNextButtonPressed,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildSetPasswordPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set a Password',
            style: AppStyles.mainHeading.copyWith(fontSize: 22),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Text(
            'Enter password for your account',
            style: AppStyles.subheading,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 30),
          CustomPasswordField(
              label: 'Password', controller: _passwordController),
          SizedBox(height: 15),
          CustomPasswordField(
            label: 'Re-Enter Password',
            controller: _reEnterPasswordController,
          ),
          SizedBox(height: 30),
          //Password Requirements
          Text(
            'Your password must have:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 20),
              SizedBox(width: 10),
              Text(
                '8 to 20 characters',
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 20),
              SizedBox(width: 10),
              Text(
                'Letters, numbers and special characters',
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            text: 'Next',
            onPressed: _onNextButtonPressed,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildAddAvailabilityPage() {
    TimeOfDay startTime = TimeOfDay(hour: 7, minute: 0);
    TimeOfDay endTime = TimeOfDay(hour: 17, minute: 0);
    List<String> selectedDays = ['Mon'];
    bool isAllDay = false;

    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Availability',
            style: AppStyles.mainHeading.copyWith(fontSize: 22),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Text(
            'Please add saloon availability. It might help clients to book your services.',
            style: AppStyles.subheading,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 25),
          Text(
            'Select Your Working Days',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: -10,
            runSpacing: 12,
            children:
                ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((day) {
              bool isSelected = selectedDays.contains(day);
              return ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 8),
                label: Text(day),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedDays.add(day);
                    } else {
                      selectedDays.remove(day);
                    }
                  });
                },
                backgroundColor: Color(0xFFCACACA),
                selectedColor: Color(0xFF3182CE),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                showCheckmark: false,
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isAllDay,
                    onChanged: (value) {
                      setState(() {
                        isAllDay = value ?? false;
                      });
                    },
                  ),
                  Text('All Day'),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          if (!isAllDay)
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => {(isStartTime: true)},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        startTime.format(context),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text('-',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => {(isStartTime: false)},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        endTime.format(context),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    // Add functionality
                  },
                ),
              ],
            ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // Add functionality
            },
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.black),
                SizedBox(width: 5),
                Text(
                  'Add',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            text: 'Next',
            onPressed: () {
              _onNextButtonPressed();
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildAddProfileImagePage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Add Profile Photo',
            style: AppStyles.mainHeading.copyWith(fontSize: 22),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Text(
            'Please add a saloon real photo, It might be help clients to get to you',
            style: AppStyles.subheading,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 70),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.person, size: 60, color: Colors.grey),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Max size of image 2MB',
              style: AppStyles.subheading.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(height: 120),
          Text(
            'You can add or change profile photo in the app anytime',
            style: AppStyles.subheading.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.start,
          ),
          Spacer(),
          CustomButton(
            text: 'Next',
            onPressed: _onNextButtonPressed,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildRegistrationSuccessPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Almost there !',
            style: AppStyles.mainHeading.copyWith(fontSize: 22),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Text(
            'You are one step away from completing the registration. To wrap this up, you can agree to our',
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Terms & Conditions.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We publish the Company name Terms & Conditions so that you know what to expect as you use our services.',
          ),
          SizedBox(height: 20),
          Text(
            'By checking the box below, you agree to these terms.',
          ),
          SizedBox(height: 20),
          GestureDetector(
            child: Row(
              children: [
                Checkbox(
                  value: viewModel.isCheckBoxChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      viewModel.onCheckBoxClick(value);
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Terms & Conditions',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Spacer(),
          CustomButton(
            text: 'Save',
            onPressed: _onNextButtonPressed,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  final int initialSeconds;

  const CountdownTimer({super.key, required this.initialSeconds});

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = widget.initialSeconds;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_remainingSeconds s',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF6A6A6A),
      ),
    );
  }
}
