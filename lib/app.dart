import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/core/build_mode/config/app_theme.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/env.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';

class App extends ConsumerWidget {
  /// initializing App constructor with key
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.wanderingCubes
      ..loadingStyle = EasyLoadingStyle.values.last
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = primaryColor
      ..backgroundColor = whiteColor
      ..indicatorColor = primaryColor
      ..textColor = primaryColor
      ..userInteractions = true
      ..dismissOnTap = false;

    final bool reference = ref.watch(darkModeProvider);
    return Builder(
      builder: (BuildContext context) {
        return MaterialApp.router(
          theme: customAppTheme(
            reference ? AppEnvironment.development : AppEnvironment.production,
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
