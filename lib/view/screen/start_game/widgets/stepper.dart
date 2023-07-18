import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/animated_divider.dart';
import 'package:lotteryapp/view/screen/start_game/widgets/circularc.dart';

final stepperColorProvider = StateProvider<Color>((ref) => greyColor);

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    this.dividerColor1,
    this.dividerColor2,
    this.dividerColor3,
    this.circleColor1,
    this.circleColor2,
    this.circleColor3,
  });
  final Color? dividerColor1;
  final Color? dividerColor2;
  final Color? dividerColor3;
  final Color? circleColor1;
  final Color? circleColor2;
  final Color? circleColor3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final stepperColor = ref.watch(stepperColorProvider);
                  return CircleContainer(
                    title: '1',
                    radius: 6,
                    color: circleColor1 ?? stepperColor,
                  );
                },
              ),
              Expanded(
                child: AnimatedDivider(
                  color: dividerColor1 ?? greyColor,
                  duration: const Duration(seconds: 2),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final stepperColor = ref.watch(stepperColorProvider);
                  return CircleContainer(
                    title: '2',
                    radius: 6,
                    color: circleColor2 ?? stepperColor,
                  );
                },
              ),
              Expanded(
                child: AnimatedDivider(
                  color: dividerColor2 ?? greyColor,
                  duration: const Duration(seconds: 2),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final stepperColor = ref.watch(stepperColorProvider);
                  return CircleContainer(
                    title: '3',
                    radius: 6,
                    color: circleColor3 ?? stepperColor,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
