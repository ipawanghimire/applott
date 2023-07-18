import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class HoursLeft extends StatelessWidget {
  const HoursLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 7),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            ' Hours Left',
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: whiteColor,
              height: 1,
            ),
          ),
        ],
        repeatForever: true,
      ),
    );
  }
}
