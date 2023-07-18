import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/app.dart';
import 'package:lotteryapp/core/build_mode/config/app_config.dart';

enum AppEnvironment {
  development,
  uat,
  production,
}

abstract class Env {
  Env() {
    value = this;
    setPortraitDeviceOrientation();
    initializeStartupDependenciesAndRun();
  }

  Config? config;
  Env? value;
  void setPortraitDeviceOrientation() {
    if (!kDebugMode) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  Future<void> initializeStartupDependenciesAndRun() async {
    await config?.awaitPreAppStartupDependencies();

    runZonedGuarded(
      () {
        final WidgetsBinding widgetsBinding =
            WidgetsFlutterBinding.ensureInitialized();
        FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

        runApp(const ProviderScope(child: App()));
        FlutterNativeSplash.remove();
      },
      (
        Object exception,
        StackTrace stackTrace,
      ) {},
    );
  }
}
