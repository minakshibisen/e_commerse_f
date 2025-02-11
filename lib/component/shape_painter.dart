import 'package:flutter/material.dart';

class ShapePainter extends CustomClipper<Path> {
  final double cornerPercent;

  const ShapePainter(this.cornerPercent);

  @override
  Path getClip(Size size) {
    var path = Path();
    double cornerRadius = size.width * cornerPercent;

    // Start
    path.moveTo(cornerRadius, 0);

    // Start to right corner
    path.lineTo(size.width - cornerRadius, 0);

    // right arc
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // right corner to bottom
    path.lineTo(size.width, ((size.height * .9) - cornerRadius));

    path.quadraticBezierTo(size.width, size.height * .88,
        (size.width - cornerRadius), size.height * .9);

    path.lineTo(cornerRadius, size.height);

    path.quadraticBezierTo(0, size.height, 0, (size.height - cornerRadius));

    path.lineTo(0, cornerRadius);

    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
