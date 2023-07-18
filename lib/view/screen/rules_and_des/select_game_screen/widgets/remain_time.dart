import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/hour_left.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/widgets/some_id.dart';

class RemainingTimeContainer extends StatelessWidget {
  const RemainingTimeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7879F1),
            Color(0xFF7879F1),
            Color(0xFF7879F1),
            Color(0xFF7879F1),
            Color(0xFF4A4BCC),
            Color(0xFF4A4BCC),
          ],
        ),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: SomeID(),
          ),
          HoursLeft(),
        ],
      ),
    );
  }
}
