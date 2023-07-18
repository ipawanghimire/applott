import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.lineTo(315, 0);
    path.quadraticBezierTo(335, 0, 335, 20);
    path.lineTo(335, 36);
    path.quadraticBezierTo(335, 56, 315, 56);
    path.lineTo(20, 56);
    path.quadraticBezierTo(0, 56, 0, 36);
    path.lineTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) => false;
}
