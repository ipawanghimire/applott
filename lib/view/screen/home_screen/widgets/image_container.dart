import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/game_play.dart';
import 'package:lotteryapp/view/widgets/common_widget/cachedimg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.id,
      super.key});
  final String image;
  final String title;
  final String subtitle;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: CachedImageScreen(
                  path: image,
                ),
              ),
              Expanded(
                  child: GamePlay(title: title, subtitle: subtitle, id: id)),
            ],
          ),
        ),
      ],
    );
  }
}
