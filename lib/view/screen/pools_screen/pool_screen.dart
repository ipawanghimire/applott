import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/pools_screen/widgets/pool_container.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';

class PoolsScreen extends ConsumerWidget {
  const PoolsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final bool darkmode = ref.watch(darkModeProvider);
    return Scaffold(
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
              padding: const EdgeInsets.only(top: 60),
              child: Align(
                child: CustomText(
                  title: 'Pools',
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: color.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ReusableButton(
                  padding: const EdgeInsets.only(left: 30),
                  height: 35,
                  title: 'Public',
                  topmargin: 10,
                  onpressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 30),
                  child: Text(
                    'Private',
                    style: TextStyle(
                      color: color.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 40, right: 30),
              height: 280,
              width: 260,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: const DecorationImage(
                  image: AssetImage(AppImage.pool),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: color.onPrimary.withOpacity(0.5),
                ),
              ),
            ),
            const PoolContainer(),
          ],
        ),
      ),
    );
  }
}
