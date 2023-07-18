import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/core/controller/api/api_requst.dart';
import 'package:lotteryapp/core/controller/api/gameplay/gameplay_notifier.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/crausal.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/header.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/hourly_play.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/image_container.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/profile_card.dart';

///
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamePlay = ref.watch(gamePlayNotifier);
    print(gamePlay.when(
        data: (data) {
          print("========DATA==========");
          print(data[2].game.name);
          print("========DATA==========");
        },
        error: (error, stackTrace) {},
        loading: () {}));

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: HomeScreenHeader(),
            ),
            const ProfileCard(
              image: AppImage.profile,
              title: 'Good Morning',
            ),
            CustomCarouselSlider(
              images: const [
                AppImage.slider,
                AppImage.slider,
                AppImage.slider,
                AppImage.slider,
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "Today’s Game Features",
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: gamePlay.when(
                  data: (data) {
                    return SizedBox(
                      height: 200,
                      child: GridView.builder(
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 1.1),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomContainer(
                            title: data[index].game.name,
                            subtitle: data[index].game.otherDetails,
                            image: data[index].game.images[0],
                            id: data[index].gameId.toString(),
                          );
                        },
                      ),
                    );
                  },
                  error: (error, stacktrace) {},
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "In hour's Game",
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const HourlyGamePlay(
              title: 'Mega Million Pool',
              subtitle: 'Daily 4 Morning',
            ),
            const HourlyGamePlay(
              title: 'Mega Million Pool',
              subtitle: 'Daily 4 Morning',
            ),
          ],
        ),
      ),
    );
  }
}
