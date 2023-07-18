import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/core/controller/api/api_requst.dart';
import 'package:lotteryapp/core/model/game_model/get_game_by_id.dart';
import 'package:lotteryapp/core/model/sharedPreferenceModel/sharedPreferenceModel.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';

class GameByIdNotifier extends ChangeNotifier {
  GameByID? gameByID;
  Future<GameByID> getGameById(String id) async {
    String GamesIdEndpoint = '/api/game/$id';
    final ApiRequest apiRequest = sl<ApiRequest>();
    EasyLoading.show();
    try {
      String? token = await getTokenFromPrefs();

      final response = await apiRequest.getHttp(
          baseUrl, GamesIdEndpoint, token as String, '');

      if (response?.statusCode == 200) {
        final gameById =
            GameByID.fromJson(response?.data as Map<String, dynamic>);
        gameByID = gameById;
        EasyLoading.dismiss();

        // print("=======notifier game by id==========");
        // print(gameById);
        // print("=======notifier game by id==========");

        // notifyListeners();
        // print("=======notifier game by id KO NAME==========");
        // print(gameByID!.name);
        // print("=======notifier game by id==========");
        return gameById;
      } else {
        await EasyLoading.showError('Failed to fetch game by ID');
        throw Exception();
      }
    } catch (error) {
      await EasyLoading.showError(error.toString());
      // print("=====ERROR YETA HO========");
      // print(error.toString());
      // print("=============");

      throw error;
    }
  }
}
