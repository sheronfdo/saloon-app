import 'package:flutter/material.dart';

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 55, 248, 132)
      ..style = PaintingStyle.fill;

    final randomDots = [
      Offset(size.width * 0.01, size.height * 0.1),
      Offset(size.width * 0.9, size.height * 0.18),
      Offset(size.width * 0.13, size.height * 0.5),
      Offset(size.width * 1.0, size.height * 0.6),
      Offset(size.width * 0.5, size.height * 0.03),
      Offset(size.width * 0.1, size.height * 0.9),
    ];

    for (final dot in randomDots) {
      canvas.drawCircle(dot, 6, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
