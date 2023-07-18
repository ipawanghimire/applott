import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  // New color parameter for text color

  const ReusableTextFormField({
    required this.label,
    required this.controller,
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.fontSize = 12.0,
    this.validator,
    this.underlineColor,
    this.textColor, // Include the color parameter in the constructor
  });
  final String label;
  final TextEditingController controller;
  final Widget? leftIcon;
  final IconData? rightIcon;
  final double fontSize;
  final FormFieldValidator<String>? validator;
  final Color? underlineColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final color = textColor ?? Theme.of(context).colorScheme.onPrimary;
    // Use the provided color if available,otherwise use the default color
    final defaultUnderlineColor = color; // Default color from the original code
    final finalUnderlineColor = underlineColor ?? defaultUnderlineColor;

    return TextFormField(
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
      ), // Use the color for text color
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: finalUnderlineColor,
          ),
        ),
        labelText: label,
        prefixIcon: leftIcon,
        suffixIcon: rightIcon != null ? Icon(rightIcon) : null,
        labelStyle: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: finalUnderlineColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
