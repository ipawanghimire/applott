import 'package:lotteryapp/core/build_mode/config/app_config.dart';
import 'package:lotteryapp/env.dart';

///development class which extends App Enviroment class and overrides its property
class Development extends Env {
  @override
  final Config config = Config(
    appEnvironment: AppEnvironment.development,
    api: Api(baseUrl: ''),
  );
}
