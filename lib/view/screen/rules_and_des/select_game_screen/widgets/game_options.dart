import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/check_game.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Select Game Type',
                  textStyle: myTextStyle.copyWith(color: whiteColor),
                ),
              ],
              repeatForever: true,
              onTap: () {},
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: CheckGame(title: 'Pick 5 number'),
        ),
        const CheckGame(title: 'Pick your Powerball'),
        const CheckGame(title: 'Power your play with Powerplay'),
        const CheckGame(title: 'Multi Draw option'),
        const CheckGame(title: 'Grand/Jackpot prize'),
        const Divider(color: whiteColor, height: 3),
        const ListTile(
          leading: CustomText(title: 'Total Amount'),
          trailing: CustomText(title: r'$ 9.00'),
        ),
        const Divider(color: whiteColor, height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ReusableButton(
            onpressed: () {
              context.push(firstGameScreen);
            },
            width: 290,
            height: 40,
            textcolor: whiteColor,
            bottomMargin: 15,
            title: 'Next',
            topmargin: 15,
            buttonColor: greenColor,
          ),
        ),
      ],
    );
  }
}
