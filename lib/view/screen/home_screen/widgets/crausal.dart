import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({required this.images, super.key});
  final List<String> images;

  @override
  CustomCarouselSliderState createState() => CustomCarouselSliderState();
}

class CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: size.height * 0.22, // 20% of the screen height
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  widget.images[index],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              widget.images.length,
              (int index) {
                if (_currentPage == index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: createDarkBlueGradient(),
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 20,
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                  );
                } else {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
