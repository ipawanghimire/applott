import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SomeID extends StatelessWidget {
  const SomeID({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 7),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            '09:08:33',
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        repeatForever: true,
      ),
    );
  }
}
