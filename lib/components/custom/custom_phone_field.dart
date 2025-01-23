import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController? phoneController;
  final Function(PhoneNumber)? onPhoneChanged;
  final String label; // Added a label parameter for the "Phone Number" label

  const CustomPhoneField({
    super.key,
    this.phoneController,
    this.onPhoneChanged,
    this.label = '',
  });

  @override
  _CustomPhoneFieldState createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'LK');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the Phone Number
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8), // Space between label and input field

        // Input Field for Phone Number
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF3182CE), width: 1.5),
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xFFF6F6F6),
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              setState(() {
                _phoneNumber = number;
              });
              if (widget.onPhoneChanged != null) {
                widget.onPhoneChanged!(number);
              }
            },
            initialValue: _phoneNumber,
            textFieldController: widget.phoneController,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              leadingPadding: 10,
            ),
            inputDecoration: const InputDecoration(
              hintText: "00 000 0000",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            countries: const [
              'US',
              'GB',
              'LK',
              'IN'
            ], // List of supported countries
          ),
        ),
      ],
    );
  }
}
