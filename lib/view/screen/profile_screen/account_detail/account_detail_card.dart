import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1,
      color: whiteColor,
    );
    return Container(
      width: 301,
      height: 170,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            Color(0x66FFFFFF),
            Color(0x1AFFFFFF),
          ],
        ),
        border: Border.fromBorderSide(
          BorderSide(width: 2, color: Color(0x80FFFFFF)),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'XXXX',
                  style: textStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Visa',
                  style: textStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Available Balance',
              style: textStyle,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'XXXX XXXX XXXX 4561',
                    style: textStyle,
                  ),
                  Icon(Icons.visibility),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
