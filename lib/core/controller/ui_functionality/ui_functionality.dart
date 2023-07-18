import 'package:flutter/material.dart';

double convertFigmaToFlutterPixel(double figmaPt) {
  const double figmaScreenSize = 375; // Figma screen size in points
  const double flutterScreenSize = 360; // Flutter screen size in logical pixels

  const double figmaToFlutterRatio = flutterScreenSize / figmaScreenSize;
  return figmaPt * figmaToFlutterRatio;
}

double getHeight(BuildContext context, double figmaPt) {
  final mediaQuery = MediaQuery.of(context);
  const figmaScreenSize = 375.0; // Figma screen size in points
  final flutterScreenSize =
      mediaQuery.size.height; // Flutter screen size in logical pixels

  final figmaToFlutterRatio = flutterScreenSize / figmaScreenSize;
  return figmaPt * figmaToFlutterRatio;
}

double getWidth(BuildContext context, double figmaPt) {
  final mediaQuery = MediaQuery.of(context);
  const figmaScreenSize = 375.0; // Figma screen size in points
  final flutterScreenSize =
      mediaQuery.size.width; // Flutter screen size in logical pixels

  final figmaToFlutterRatio = flutterScreenSize / figmaScreenSize;
  return figmaPt * figmaToFlutterRatio;
}
