import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/card.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/fav_body.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/number.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkmode = ref.watch(darkModeProvider);
    final TextStyle textStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1,
      color: Theme.of(context).colorScheme.onPrimary,
    );

    return Scaffold(
      backgroundColor: darkModeprimaryColor,
      body: Container(
        decoration: !darkmode
            ? null
            : const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.favBack),
                  fit: BoxFit.fill,
                ),
              ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Align(
                child: CustomText(
                  title: 'My Favourite',
                  textStyle: textStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                title: 'Ticket 3',
                textStyle: textStyle.copyWith(fontSize: 17, height: 1.2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MyNumber(),
            ),
            const FavBody(),
            const FavCard(),
            const FavCard(),
          ],
        ),
      ),
    );
  }
}
