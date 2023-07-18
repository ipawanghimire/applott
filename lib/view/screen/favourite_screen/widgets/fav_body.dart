import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/circle_grid_view.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';

class FavBody extends ConsumerWidget {
  const FavBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(darkModeProvider);
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    final textstyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      height: 1.5, // This will be equivalent to line height of 30sp
      color: onPrimary,
    );
    return Container(
      width: 335,
      height: 290,
      margin: const EdgeInsets.only(left: 20, top: 35, right: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image:
              AssetImage(!darkMode ? AppImage.favDarkBody : AppImage.favBody),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: onPrimary.withOpacity(0.5),
          //width: 1,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Select Number',
              textStyle: textstyle,
            ),
          ),
          const Expanded(child: CircleGridView(itemCount: 24, circleSize: 20)),
        ],
      ),
    );
  }
}
