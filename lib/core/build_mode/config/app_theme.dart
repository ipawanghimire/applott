import 'package:flutter/material.dart';
import 'package:lotteryapp/env.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_font.dart';

ThemeData customAppTheme(AppEnvironment env) => ThemeData(
      fontFamily: AppFont.defaultFont,
      buttonTheme: const ButtonThemeData(buttonColor: whiteColor),
      cardColor:
          env == AppEnvironment.development ? whiteColor : darkModeprimaryColor,
      useMaterial3: true,
      iconTheme: const IconThemeData(color: whiteColor),
      primaryColor: env == AppEnvironment.development
          ? primaryColor
          : darkModeprimaryColor,
      scaffoldBackgroundColor: env == AppEnvironment.development
          ? primaryColor
          : darkModeprimaryColor,
      colorScheme: ColorScheme.fromSeed(
        secondary: whiteColor,
        seedColor: primaryColor,
        onPrimary: whiteColor,
      ),
      textTheme: AppTextTheme._textTheme,
    );

///Text theme of App
class AppTextTheme {
  AppTextTheme._();

  static const TextTheme _textTheme = TextTheme(
    bodyLarge: _defaultFont,
    // bodyText2: _defaultFont,
  );

  static const TextStyle _defaultFont = TextStyle(
    fontFamily: AppFont.defaultFont,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: textColor,
    fontSize: 14,
  );
}
