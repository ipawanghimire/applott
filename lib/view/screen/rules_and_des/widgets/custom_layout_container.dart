import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/common_widget/play_button.dart';

class CustomStyledContainer extends StatelessWidget {
  const CustomStyledContainer({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle myTextStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.21,
      color: whiteColor,
    );

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 5, // Updated left margin
        top: 12,
        right: 15, // Updated top margin,
      ),
      decoration: customBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text('All or Nothing', style: myTextStyle),
              Padding(
                padding: const EdgeInsets.only(bottom: 11, top: 11, right: 15),
                child: Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      color: yellowColor,
                      size: 15,
                    ),
                  ),
                ),
              ),
              Text(
                r'Minimum :$2.0',
                style: myTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          PlayButton(
            onTap: () {
              context.push(selectGameScreen);
            },
            text: 'Play',
            padding: const EdgeInsets.all(8),
          ),
        ],
      ),
    );
  }
}
