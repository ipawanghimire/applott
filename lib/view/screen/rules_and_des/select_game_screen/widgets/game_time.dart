import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/remain_time.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/start_time.dart';

class GameTime extends StatelessWidget {
  const GameTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: whiteColor,
      ),
      child: const Row(
        children: [
          RemainingTimeContainer(),
          Column(
            children: [
              Friday4PM(),
            ],
          ),
        ],
      ),
    );
  }
}
