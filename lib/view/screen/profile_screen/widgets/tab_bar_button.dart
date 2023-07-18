import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    super.key,
    this.buttonTitle,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    );
    return isSelected
        ? ReusableButton(
            padding: EdgeInsetsDirectional.zero,
            height: 32,
            topmargin: 2,
            title: text,
            onpressed: onPressed,
            child: Text(
              text,
              style: textStyle,
            ),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: textStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          );
  }
}
