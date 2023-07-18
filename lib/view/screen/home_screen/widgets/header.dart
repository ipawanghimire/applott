import 'package:flutter/material.dart';
import 'package:lotteryapp/view/widgets/common_widget/button_component.dart';
import 'package:lotteryapp/view/widgets/common_widget/dropdown.dart';
import 'package:lotteryapp/view/widgets/common_widget/search_component.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 35),
          child: DropdownComponent(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: ButtonComponent(
            title: 'Wallet',
            onPressed: () {
              // Add your desired action here
            },
          ),
        ),
        const SearchField(),
      ],
    );
  }
}
