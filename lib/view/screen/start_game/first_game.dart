import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/number.dart';
import 'package:lotteryapp/view/screen/rules_and_des/widgets/mega_million_pool.dart';
import 'package:lotteryapp/view/screen/start_game/widgets/stepper.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';
import 'package:lotteryapp/view/widgets/common_widget/back_button.dart';

class FirstGame extends StatefulWidget {
  const FirstGame({
    super.key,
  });

  @override
  FirstGameState createState() => FirstGameState();
}

class FirstGameState extends State<FirstGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.allOrNothing),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            const CircularArrow(title: 'Pick 5 Number'),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: CustomStepper(
                dividerColor1: greenColor,
                circleColor1: greenColor,
                circleColor2: greenColor,
              ),
            ),
            MegaMillionPoolContainer(
              gameOptions: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(title: 'Select the Favorite ticket'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: FadeTransition(
                      opacity: _fadeAnimation!,
                      child: const MyNumber(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReusableButton(
                        textcolor: whiteColor,
                        buttonColor: const Color(0x66FFFFFF),
                        height: 40,
                        title: 'Mix it up',
                        topmargin: 40,
                        bottomMargin: 10,
                        onpressed: () {},
                      ),
                      ReusableButton(
                        textcolor: whiteColor,
                        buttonColor: const Color(0x66FFFFFF),
                        height: 40,
                        title: 'Customize',
                        topmargin: 40,
                        bottomMargin: 10,
                        onpressed: () {
                          context.push(customizeGameScreen);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: FadeTransition(
                      opacity: _fadeAnimation!,
                      child: ReusableButton(
                        textcolor: whiteColor,
                        width: 290,
                        buttonColor: greenColor,
                        height: 40,
                        title: 'Next',
                        topmargin: 12,
                        bottomMargin: 20,
                        onpressed: () {
                          context.push(gameEndScreen);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
