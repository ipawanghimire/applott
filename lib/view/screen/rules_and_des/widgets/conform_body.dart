import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/common_widget/play_button.dart';

class ConformBody extends StatelessWidget {
  const ConformBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      title: CustomText(
        title: 'Powerball',
        textStyle: myTextStyle.copyWith(fontSize: 19),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: CustomText(
          title: 'Drawing Friday 10:00',
          textStyle: myTextStyle.copyWith(fontSize: 10),
        ),
      ),
      trailing: const PlayButton(
        text: r'$ 3',
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        textStyle: TextStyle(
          color: greenColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
