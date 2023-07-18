import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/game_time.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/mega_million_header.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/played_game.dart';
import 'package:lotteryapp/view/screen/start_game/widgets/stepper.dart';
import 'package:lotteryapp/view/widgets/common_widget/back_button.dart';

class GameEndConformScreen extends StatelessWidget {
  const GameEndConformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.allOrNothing),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            const CircularArrow(title: 'Confirmation'),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: CustomStepper(
                dividerColor1: greenColor,
                circleColor1: greenColor,
                dividerColor2: greenColor,
                circleColor2: greenColor,
                dividerColor3: greenColor,
                circleColor3: greenColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              decoration: customBoxDecoration,
              child: Column(
                children: [
                  MegaMillionHeader(
                    title1: 'Thank You',
                    textStyle1: myTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    title2: 'Mega Million Pools',
                    textStyle2: myTextStyle,
                    title3: r'Fri-jan 27-$869589578 7',
                    textStyle3: myTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const GameTime(),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Divider(
                      color: whiteColor,
                      height: 3,
                    ),
                  ),
                  const PlayedGame(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
