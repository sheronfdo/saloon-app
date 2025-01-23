import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(
          color: Color(0xFF79280A),
        ),
      );
    },
  );
}

void hideLoader(BuildContext context) {
  Navigator.pop(context);
}
