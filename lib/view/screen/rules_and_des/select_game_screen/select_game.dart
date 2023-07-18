import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/mega_million_pool.dart';
import 'package:lotteryapp/view/screen/start_game/widgets/stepper.dart';
import 'package:lotteryapp/view/widgets/common_widget/back_button.dart';

class SelectGame extends StatelessWidget {
  const SelectGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.allOrNothing),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: const [
              CircularArrow(title: 'Select Game'),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CustomStepper(
                  circleColor1: greenColor,
                ),
              ),
              MegaMillionPoolContainer(),
            ],
          ),
        ),
      );
}
