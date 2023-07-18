import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    required this.title,
    required this.index,
    super.key,
    this.onTap,
    this.isSelected = false,
    this.image,
  });
  final String title;
  final void Function(int index)? onTap;
  final bool isSelected;
  final int index;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null ? () => onTap?.call(index) : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: isSelected ? darkBlue : whiteColor,
        ),
        child: Center(
          child: Stack(
            children: [
              Align(
                child: Transform.rotate(
                  angle: isSelected ? pi * 2 : 0,
                  child: image ?? const SizedBox.shrink(),
                ),
              ),
              Align(
                child: Transform.rotate(
                  angle: isSelected ? pi * 2 : 0,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: isSelected ? 12 : 11.5,
                      height: 1.5,
                      color: isSelected ? whiteColor : darkBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
