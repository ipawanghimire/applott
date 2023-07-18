import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/widgets/common_widget/play_button.dart';

class PoolListTile extends StatelessWidget {
  const PoolListTile({
    required this.title,
    super.key,
    this.date,
    this.price,
    this.additionalColumn,
  });
  final String title;
  final String? date;
  final String? price;
  final Widget? additionalColumn;

  @override
  Widget build(BuildContext context) {
    const textStyle2 = TextStyle(color: greenColor);
    final color = Theme.of(context).colorScheme;
    final textStyle3 = TextStyle(fontSize: 14, color: color.onPrimary);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, right: 8),
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image:
                    AssetImage(AppImage.game), // Replace with your image asset
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyle3.copyWith(fontWeight: FontWeight.w600),
                ),
                if (date != null) const SizedBox(height: 8),
                if (date != null)
                  Text(
                    date.toString(),
                    style: textStyle3,
                  ),
                if (price != null) const SizedBox(height: 8),
                if (price != null)
                  Text(
                    price.toString(),
                    style: textStyle3.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
          additionalColumn ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '09:08',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color.onPrimary,
                    ),
                  ),
                  Text(
                    'Hours left',
                    style: textStyle2.copyWith(
                      color: color.onPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    child: PlayButton(
                      textStyle: textStyle2,
                      text: 'Invite',
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 10),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
