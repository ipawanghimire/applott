import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';

class PlayedGame extends StatelessWidget {
  const PlayedGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(title: 'Played Game'),
          ),
        ),
        Column(
          children: List.generate(
            3,
            (index) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Image.asset(
                    AppImage.checkSquare,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomText(
                    title: 'Pic 5 Number',
                    textStyle: myTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Divider(color: whiteColor, height: 2),
        ),
        const ListTile(
          leading: CustomText(title: 'Total Amount'),
          trailing: CustomText(title: r'$ 9.00'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(color: whiteColor, height: 2),
        ),
        ReusableButton(
          onpressed: () {
            context.push(ticketConformScreen);
          },
          width: 290,
          height: 40,
          textcolor: whiteColor,
          bottomMargin: 45,
          title: 'Submit',
          topmargin: 15,
          buttonColor: greenColor,
        ),
      ],
    );
  }
}
