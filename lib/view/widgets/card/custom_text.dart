import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.title,
    super.key,
    this.textStyle,
    this.color,
  });
  final String title;
  final TextStyle? textStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context).colorScheme.onPrimary;
    final finalColor = color ?? defaultColor;
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 12),
      child: Text(
        title,
        style: textStyle ??
            TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.14,
              color: finalColor,
            ),
      ),
    );
  }
}
