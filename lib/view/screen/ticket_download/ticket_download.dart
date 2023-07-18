import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_font.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/screen/favourite_screen/widgets/circle_grid_view.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/common_widget/back_button.dart';

class TicketDownload extends StatefulWidget {
  const TicketDownload({super.key});

  @override
  TicketDownloadState createState() => TicketDownloadState();
}

class TicketDownloadState extends State<TicketDownload>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );
    _animationController?.repeat(reverse: true); // Start the animation
  }

  @override
  void dispose() {
    _animationController?.dispose(); // Clean up the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: ListView(
        children: [
          const CircularArrow(title: 'Ticket Confirmation'),
          Container(
            width: width * 0.45,
            margin: const EdgeInsets.only(top: 35, left: 30, right: 30),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            color: greenColor,
            child: Row(
              children: [
                FadeTransition(
                  opacity: Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: _animationController!,
                      curve: Curves.easeIn,
                    ),
                  ),
                  child: Image.asset(AppImage.download),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CustomText(title: 'Download PDF'),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.85,
            height: height * 0.39,
            margin: const EdgeInsets.only(top: 25, left: 10, right: 10),
            decoration: customBoxDecoration.copyWith(color: whiteColor),
            child: Container(
              width: width,
              height: 56,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: const CircleGridView(itemCount: 24, circleSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: whiteColor,
            ),
            child: ListTile(
              leading: FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    parent: _animationController!,
                    curve: Curves.easeIn,
                  ),
                ),
                child: Image.asset(AppImage.fireBall),
              ),
              title: Text(
                'POWERBALL',
                style: myTextStyle.copyWith(color: primaryColor, fontSize: 14),
              ),
              subtitle: const Text(
                'The number of fireball is 19',
                style: TextStyle(
                  fontFamily: AppFont.defaultFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
