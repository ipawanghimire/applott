import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';

class HourlyGamePlay extends StatelessWidget {
  const HourlyGamePlay({
    required this.title,
    required this.subtitle,
    super.key,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    TextStyle getTextStyle(BuildContext context) {
      return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Theme.of(context).primaryColor,
      );
    }

    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          backgroundImage: AssetImage(AppImage.game),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: onPrimary,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow),
            const SizedBox(width: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: whiteColor,
              ),
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: onPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            'Play',
            style: getTextStyle(context),
          ),
        ),
      ),
    );
  }
}
