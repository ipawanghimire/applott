import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';

class ConformBody extends StatelessWidget {
  const ConformBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(title: 'Select Game Type'),
        const Divider(color: whiteColor, height: 3),
        const ListTile(
          leading: CustomText(title: 'Total Amount'),
          trailing: CustomText(title: r'$ 9.00'),
        ),
        const Divider(color: whiteColor, height: 3),
        ReusableButton(
          onpressed: () {
            context.push(firstGameScreen);
          },
          width: 290,
          height: 40,
          textcolor: whiteColor,
          bottomMargin: 15,
          title: 'Thank you',
          topmargin: 15,
          buttonColor: greenColor,
        ),
      ],
    );
  }
}
