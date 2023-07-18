import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/core/controller/api/api_requst.dart';
import 'package:lotteryapp/core/model/game_model/get_featured_games.dart';
import 'package:lotteryapp/core/model/game_model/get_game_by_id.dart';
import 'package:lotteryapp/core/model/sharedPreferenceModel/sharedPreferenceModel.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';

/// CustomersNotifier
class GamePlayNotifier extends AsyncNotifier<List<FeaturedGame>> {
  Future<List<FeaturedGame>> fetchGameList() async {
    final List<FeaturedGame> game = await getFeaturedGames();
    return game;
  }

  Future<List<FeaturedGame>> getFeaturedGames() async {
    // Replace with your API URL for fetching featured games
    const String featuredGamesEndpoint = '/api/featured/active';
    final ApiRequest apiRequest = sl<ApiRequest>();
    final List<FeaturedGame> featuredGames = [];
    try {
      state = const AsyncValue.loading();
      String? token = await getTokenFromPrefs();

      final response = await apiRequest.getHttp(
          baseUrl, featuredGamesEndpoint, token as String, '');

      if (response?.statusCode == 200) {
        for (var gameData in response?.data as List<dynamic>) {
          final featuredGame =
              FeaturedGame.fromJson(gameData as Map<String, dynamic>);
          featuredGames.add(featuredGame);
        }
        return featuredGames;
        // Do something with the featured games list if needed

        // Change to the appropriate data type
      } else {
        throw Exception('Failed to fetch featured games');
      }
    } catch (error) {
      await EasyLoading.showError(
          'Failed to fetch featured games. Please try again.');
    }
    return featuredGames;
  }

  @override
  Future<List<FeaturedGame>> build() => fetchGameList();
}

/// asyncCustomerProvider
final gamePlayNotifier =
    AsyncNotifierProvider<GamePlayNotifier, List<FeaturedGame>>(
  () => GamePlayNotifier(),
);
