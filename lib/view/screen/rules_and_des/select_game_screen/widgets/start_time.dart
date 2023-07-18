import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Friday4PM extends StatelessWidget {
  const Friday4PM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Column(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Friday, 4pm',
                textStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xFF414BC3),
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            repeatForever: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Cut off time',
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xffE0E0E0),
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              repeatForever: true,
            ),
          ),
        ],
      ),
    );
  }
}
