import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController?  controller;
  final Function(PhoneNumber)? onPhoneChanged;
  final String label;

  const CustomPhoneField({
    Key? key,
    this.controller,
    this.onPhoneChanged,
    this.label = '',
  }) : super(key: key);

  @override
  _CustomPhoneFieldState createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'LK'); // Default country code
  String selectedCountry = 'Sri Lanka'; // Default country

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
        const SizedBox(height: 8),
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
                // Update selected country
                selectedCountry = number.isoCode == 'QA'
                    ? 'Qatar'
                    : number.isoCode == 'LK'
                    ? 'Sri Lanka'
                    : 'Unknown';
              });
              if (widget.onPhoneChanged != null) {
                widget.onPhoneChanged!(number);
              }
            },
            initialValue: _phoneNumber,
            textFieldController: widget.controller,
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
              'QA', // Qatar
              'LK', // Sri Lanka
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Display Selected Country
        Text(
          selectedCountry,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
