import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/model/sharedPreferenceModel/sharedPreferenceModel.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/more_screen/widgets/header.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String _userName = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _initUserDetails();
  }

  void _initUserDetails() async {
    _userName = await getUserNameFromPrefs() ?? '';
    _email = await getEmailFromPrefs() ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 15, left: 10),
                child: CustomDrawerItem(
                  leading: Image.asset(AppImage.profile),
                  title: _userName,
                  subtitle: _email,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Divider(
                  height: 2,
                  color: whiteColor,
                ),
              ),
              CustomCard(
                onTap: () {
                  context.push(profileScreen);
                },
                leadingIconPath: AppImage.user,
                title: 'Profile',
              ),
              CustomCard(
                onTap: () {
                  context.push(favouriteScreen);
                },
                leadingIconPath: AppImage.tag,
                title: 'Favourite Ticket',
              ),
              const CustomCard(
                leadingIconPath: AppImage.disc,
                title: 'Favourite Lottery',
              ),
              CustomCard(
                onTap: () {
                  context.push(registerScreen);
                },
                leadingIconPath: AppImage.settings,
                title: 'Sign In',
              ),
              CustomCard(
                leadingIconPath: AppImage.play,
                title: 'Auto Play',
                onTap: () {
                  context.push(rulesAndReviewScreen);
                },
              ),
              CustomCard(
                onTap: () {
                  context.push(poolScreen);
                },
                leadingIconPath: AppImage.copy,
                title: 'Pools',
              ),
              const CustomCard(
                leadingIconPath: AppImage.settings,
                title: 'Setting',
              ),
              const Divider(
                height: 2,
                color: whiteColor,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: CustomCard(
                  leadingIconPath: AppImage.light,
                  showSwitchMode: true,
                  title: 'Mode',
                ),
              ),
              ReusableButton(
                onpressed: () {
                  context.go(loginScreen);
                },
                title: 'Log Out',
                bottomMargin: 40,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                topmargin: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
