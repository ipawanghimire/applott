import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    required this.radius,
    required this.color,
    required this.title,
    super.key,
  });
  final double radius;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: whiteColor,
      radius: 15,
      child: Container(
        width: radius * 3.5,
        height: radius * 3.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Align(
          child: Text(
            title,
            style: myTextStyle.copyWith(color: whiteColor, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
