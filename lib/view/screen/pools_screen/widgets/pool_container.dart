import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/screen/pools_screen/widgets/pool_listile.dart';

class PoolContainer extends StatelessWidget {
  const PoolContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.4, 1.0],
              colors: [
                whiteColor.withOpacity(0.1),
                whiteColor.withOpacity(0.4),
              ],
            ),
            border: const Border.fromBorderSide(BorderSide(color: whiteColor)),
          ),
          child: const PoolListTile(
            title: 'Mega Million Pool',
            date: '27 May 2023',
            price: r'Win: $ 2354456',
          ),
        ),
        Positioned(
          top: 32,
          left: 257,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 143,
          left: 257,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
