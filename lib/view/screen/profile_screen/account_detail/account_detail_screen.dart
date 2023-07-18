import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/pools_screen/widgets/pool_container.dart';
import 'package:lotteryapp/view/screen/profile_screen/account_detail/account_detail_card.dart';
import 'package:lotteryapp/view/widgets/common_widget/tab_bar_switch.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Align(
        //   alignment: Alignment.topRight,
        //   child: ReusableButton(
        //     height: 35,
        //     padding: EdgeInsets.only(right: 25),
        //     bottomMargin: 15,
        //     title: 'Add Card',
        //     topmargin: 5,
        //     onpressed: () {},
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(right: 35, bottom: 5, left: 20),
          child: AccountCard(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 10),
          child: TabBarSwitch(),
        ),
        PoolContainer(),
        PoolContainer(),
      ],
    );
  }
}
