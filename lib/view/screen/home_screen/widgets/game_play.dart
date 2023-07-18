import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/controller/api/gameplay/getgamebyid_notifier.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';

class GamePlay extends StatefulWidget {
  const GamePlay(
      {required this.title,
      required this.subtitle,
      super.key,
      required this.id});

  final String title;
  final String subtitle;
  final String id;

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    TextStyle getTextStyle(BuildContext context) {
      return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Theme.of(context).primaryColor,
      );
    }

    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: onPrimary,
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: onPrimary,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: onPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: InkWell(
            onTap: () async {
              final GameByIdNotifier gameWithId = sl<GameByIdNotifier>();
              await gameWithId.getGameById(widget.id.toString());

              context.push(rulesAndReviewScreen, extra: {'id': widget.id});
            },
            child: Text(
              'Play',
              style: getTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }
}
