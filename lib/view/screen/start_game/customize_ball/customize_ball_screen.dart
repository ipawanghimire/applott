import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/start_game/customize_ball/customize_body.dart';
import 'package:lotteryapp/view/widgets/common_widget/back_button.dart';

class CustomizeBall extends StatelessWidget {
  const CustomizeBall({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CircularArrow(title: 'Customize'),
          Expanded(child: CustomizeBody()),
        ],
      ),
    );
  }
}
