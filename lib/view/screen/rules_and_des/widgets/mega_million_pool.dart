import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/game_options.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/game_time.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/conform_body.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/mega_million_header.dart';

enum StartGame { start, resume, end }

class MegaMillionPoolContainer extends StatelessWidget {
  const MegaMillionPoolContainer({super.key, this.gameOptions});
  final Widget? gameOptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      decoration: customBoxDecoration,
      child: Column(
        children: [
          const MegaMillionHeader(),
          const GameTime(),
          const ConformBody(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Divider(
              color: whiteColor,
              height: 3,
            ),
          ),
          gameOptions ?? const GameOptions(),
        ],
      ),
    );
  }
}
