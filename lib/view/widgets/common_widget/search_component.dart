import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotteryapp/core/controller/ui_functionality/ui_functionality.dart';
import 'package:lotteryapp/resources/app_images.dart';

class SearchField extends StatelessWidget {
  ///
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double figmaPixel = 19;
    final double flutterPixel = convertFigmaToFlutterPixel(figmaPixel);
    return SvgPicture.asset(
      AppImage.search,
      width: flutterPixel,
      height: flutterPixel,
    );
  }
}
