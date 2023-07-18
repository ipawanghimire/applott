import 'package:get_it/get_it.dart';
import 'package:lotteryapp/core/controller/api/api_requst.dart';
import 'package:lotteryapp/core/controller/api/gameplay/gameplay_notifier.dart';
import 'package:lotteryapp/core/controller/api/gameplay/getgamebyid_notifier.dart';
import 'package:lotteryapp/core/controller/api/login_api/login_service.dart';

///get it for dependency injection or service Locator
final GetIt sl = GetIt.instance;

///for setting AppEnvironment of Inversion of control
Future<dynamic> init() {
  sl.registerLazySingleton(() => ApiRequest());
  sl.registerLazySingleton(() => LoginService());
  sl.registerLazySingleton(() => GamePlayNotifier());
  sl.registerLazySingleton(() => GameByIdNotifier());
  return sl.allReady();
}
