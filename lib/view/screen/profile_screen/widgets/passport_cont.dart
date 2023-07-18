import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_images.dart';

class PassportContainer extends StatelessWidget {
  const PassportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 181,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage(
            AppImage.passport,
          ), // Replace with the actual image path
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
