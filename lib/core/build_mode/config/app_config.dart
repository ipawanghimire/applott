import 'package:lotteryapp/env.dart';
import 'package:lotteryapp/helper/dependency_injection.dart' as di;

///for Configuring AppEnvironment and its Api base Url
class Config {
  ///Constructor for the Configuration with required parameter
  Config({
    required this.api,
    required this.appEnvironment,
  });

  AppEnvironment appEnvironment;

  Api api;

  ///function  for defining which waits and checks for platform and preStart Services like ios or android or window insert here preAppStart dependencies like await firebase ,init,widgetbinding many more
  Future<void> awaitPreAppStartupDependencies() async {
    await di.init();
  }
}

class Api {
  ///constructor for  API class
  Api({
    required this.baseUrl,
  });

  ///base url of API for communication between user and server
  String baseUrl;
}
