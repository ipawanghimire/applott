import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/number.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';

class FavCard extends ConsumerWidget {
  const FavCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(darkModeProvider);
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Container(
      width: 335,
      height: 120,
      margin: const EdgeInsets.only(left: 20, top: 40, right: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image:
              AssetImage(!darkMode ? AppImage.favDarkCard : AppImage.favCard),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: onPrimary.withOpacity(0.5),
          //width: 1,
        ),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(title: 'Ticket 1'),
              Padding(
                padding: EdgeInsets.all(8),
                child: CustomText(title: 'Edit '),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: MyNumber(
              radius: 18,
            ),
          ),
        ],
      ),
    );
  }
}
