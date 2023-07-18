import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/circle_grid_view.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/number.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';

class CustomizeBody extends StatelessWidget {
  const CustomizeBody({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    final textstyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      height: 1.5, // This will be equivalent to line height of 30sp
      color: onPrimary,
    );
    return Container(
      width: 335,
      margin: const EdgeInsets.only(left: 20, top: 35, right: 20, bottom: 200),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            width: 2,
            color: Color(0x80FFFFFF),
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(AppImage.allOrNothing),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const MyNumber(),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Select 5 Number',
              textStyle: textstyle,
            ),
          ),
          const Expanded(child: CircleGridView(itemCount: 24, circleSize: 30)),
          ReusableButton(
            textcolor: whiteColor,
            buttonColor: greenColor,
            onpressed: () {},
            width: 300,
            height: 40,
            title: 'Submit',
            topmargin: 20,
            bottomMargin: 20,
          ),
        ],
      ),
    );
  }
}
