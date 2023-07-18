import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/profile_tab.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/profile_card.dart';
import 'package:lotteryapp/view/widgets/common_widget/play_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 65, bottom: 25),
            child: CustomText(
              title: 'Profile',
              textStyle: TextStyle(
                fontSize: 18,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: ProfileCard(
              trailing: PlayButton(
                text: 'Edit',
                padding: EdgeInsets.all(6),
              ),
              image: AppImage.profile,
              title: 'Good Morning',
            ),
          ),
          Expanded(child: ProfileTab()),
        ],
      ),
    );
  }
}
