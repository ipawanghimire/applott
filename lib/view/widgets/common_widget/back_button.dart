import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class CircularArrow extends StatelessWidget {
  const CircularArrow({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 8),
        child: Row(
          children: [
            const Center(
              child: Icon(
                Icons.arrow_circle_left,
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
