import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';

class MegaMillionHeader extends StatelessWidget {
  const MegaMillionHeader({
    this.title1,
    this.title2,
    this.title3,
    this.textStyle1,
    this.textStyle2,
    this.textStyle3,
    super.key,
  });
  final String? title1;
  final String? title2;
  final String? title3;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;
  final TextStyle? textStyle3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(title: title1 ?? 'Mega Million Pool', textStyle: textStyle1),
        CustomText(
          title: title2 ?? r'Fri-jan 27-$869589578 ',
          textStyle: textStyle2 ?? myTextStyle.copyWith(fontSize: 11),
        ),
        CustomText(
          title: title3 ?? 'Entries: 2564',
          textStyle: textStyle3 ??
              myTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
