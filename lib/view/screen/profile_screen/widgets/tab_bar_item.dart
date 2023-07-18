import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({required this.title, required this.content, super.key});
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        content,
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
