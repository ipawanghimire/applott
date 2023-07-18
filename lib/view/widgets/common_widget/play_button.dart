import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    required this.text,
    super.key,
    this.textStyle,
    this.margin,
    this.padding,
    this.onTap,
  });
  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: onPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          text,
          style: textStyle ?? getTextStyle(context),
        ),
      ),
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getWidth(12),
      color: Theme.of(context).primaryColor,
    );
  }

  double getWidth(double width) {
    // Adjust the width based on the device's screen size or other factors
    return width;
  }
}
