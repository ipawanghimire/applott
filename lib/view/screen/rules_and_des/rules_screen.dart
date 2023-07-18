import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/core/controller/api/gameplay/getgamebyid_notifier.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/number.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/custom_layout_container.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/day_widget.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/common_widget/back_button.dart';
import 'package:lotteryapp/view/widgets/common_widget/playVideo.dart';
import 'package:lotteryapp/view/widgets/common_widget/tab_bar_switch.dart';

final selectedDaysProvider =
    StateProvider<List<bool>>((ref) => List.generate(6, (index) => false));

class RulesAndReviewScreen extends ConsumerWidget {
  final Map<String, dynamic> id;

  RulesAndReviewScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDays = ref.watch(selectedDaysProvider);
    GameByIdNotifier gameById = sl<GameByIdNotifier>();
    // print("=======notifierwala==========");
    // print(gameById.gameByID!.name);
    // print("=======notifierwala==========");
    List<String> daysOfPlay = [
      'Sun', // Sunday
      'Mon', // Monday
      'Tue', // Tuesday
      'Wed', // Wednesday
      'Thu', // Thursday
      'Fri', // Friday
    ];

    void toggleSelectedDay(int selectedIndex) {
      ref.read(selectedDaysProvider.notifier).state =
          List<bool>.of(selectedDays)
            ..[selectedIndex] = !selectedDays[selectedIndex];
    }

    void sendSelectedDaysToServer() {
      List<String> selectedDaysList = [];
      for (int i = 0; i < selectedDays.length; i++) {
        if (selectedDays[i]) {
          selectedDaysList.add(daysOfPlay[i]);
        }
      }
    }

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImage.allOrNothing,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            const CircularArrow(title: 'All or Nothing'),
            const Padding(
              padding: EdgeInsets.only(bottom: 19, right: 30, top: 25),
              child: CustomText(
                title: 'Previous Winner',
                textStyle: myTextStyle,
              ),
            ),
            Row(
              children: [
                Row(
                  children: List.generate(
                    daysOfPlay.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transformAlignment: Alignment.center,
                      transform: selectedDays[index]
                          ? Matrix4.rotationZ(6.28319)
                          : Matrix4.rotationZ(0),
                      child: DayWidget(
                        index: index,
                        title: daysOfPlay[index],
                        onTap: toggleSelectedDay,
                        isSelected: selectedDays[index],
                      ),
                    ),
                  ),
                ),
                DayWidget(
                  onTap: (index) {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                        2023,
                        1,
                        1,
                      ), // Replace with your desired first date
                      lastDate: DateTime(
                        2023,
                        12,
                        31,
                      ), // Replace with your desired last date
                    );
                  },
                  title: '',
                  index: 0,
                  image: Image.asset(
                    AppImage.calender,
                    height: 20,
                    color: darkBlue,
                  ),
                ),
              ],
            ),
            const MyNumber(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            ),
            const CustomStyledContainer(),
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 15),
              child: TabBarSwitch(
                text1: 'Description',
                text2: 'Rules',
                text3: 'Reviews',
              ),
            ),
            Container(
              child: Column(
                children: [
                  CustomText(
                    title: gameById.gameByID!.detail.toString(),
                    color: whiteColor,
                  ),
                  SizedBox(
                    height: 200,
                    child: PlayVideo(
                      vidpath: gameById.gameByID!.video.toString(),
                    ),
                  ),
                  Html(
                    data: gameById.gameByID!.rules.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
