import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    required this.title,
    required this.onPressed,
    super.key,
    this.width,
    this.height,
  });

  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        gradient: headerGradient(),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
