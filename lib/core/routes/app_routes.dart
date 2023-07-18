import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/view/screen/favourite_screen/fav_screen.dart';
import 'package:lotteryapp/view/screen/home_screen/main_screen.dart';
import 'package:lotteryapp/view/screen/pools_screen/pool_screen.dart';
import 'package:lotteryapp/view/screen/profile_screen/profile_screen.dart';
import 'package:lotteryapp/view/screen/register_screen/forgetscreen/forget_pw.dart';
import 'package:lotteryapp/view/screen/register_screen/login_page.dart';
import 'package:lotteryapp/view/screen/register_screen/register.dart';
import 'package:lotteryapp/view/screen/rules_and_des/rules_screen.dart';
import 'package:lotteryapp/view/screen/rules_and_des/select_game_screen/select_game.dart';
import 'package:lotteryapp/view/screen/splash_screen/splash_screen.dart';
import 'package:lotteryapp/view/screen/start_game/conform_screen/conform_screen.dart';
import 'package:lotteryapp/view/screen/start_game/customize_ball/customize_ball_screen.dart';
import 'package:lotteryapp/view/screen/start_game/first_game.dart';
import 'package:lotteryapp/view/screen/ticket_download/ticket_download.dart';

// Define route paths as static constants
const String splashScreen = '/splashScreen';
const String profileScreen = '/profileScreen';
const String favouriteScreen = '/favouriteScreen';
const String poolScreen = '/poolScreen';
const String rulesAndReviewScreen = '/rulesandReview';
const String selectGameScreen = '/selectGame';
const String firstGameScreen = '/firstGameScreen';
const String customizeGameScreen = '/customizeGameScreen';
const String loginScreen = '/';
const String mainScreen = '/mainScreen';
const String gameEndScreen = '/gameEndScreen';
const String ticketConformScreen = '/ticketConformScreen';
const String registerScreen = '/registerScreen';
const String forgetPassword = '/forgetPassword';

// Create a map to associate each path with its respective builder function

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: '/mainScreen',
      builder: (BuildContext context, GoRouterState state) => MainScreen(),
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (BuildContext context, GoRouterState state) =>
          const ForgetPassword(),
    ),
    GoRoute(
      path: splashScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: favouriteScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const FavouriteScreen(),
    ),
    GoRoute(
      path: poolScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const PoolsScreen(),
    ),
    GoRoute(
      path: profileScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const ProfileScreen(),
    ),
    GoRoute(
      path: rulesAndReviewScreen,
      builder: (BuildContext context, GoRouterState state) {
        final id = state.extra;
        // print('========go route==============');
        // print(state.extra);
        // print('======================');

        return RulesAndReviewScreen(id: id as Map<String, dynamic>);
      },
    ),
    GoRoute(
      path: selectGameScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const SelectGame(),
    ),
    GoRoute(
      path: firstGameScreen,
      builder: (BuildContext context, GoRouterState state) => const FirstGame(),
    ),
    GoRoute(
      path: customizeGameScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const CustomizeBall(),
    ),
    GoRoute(
      path: gameEndScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const GameEndConformScreen(),
    ),
    GoRoute(
      path: ticketConformScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const TicketDownload(),
    ),
    GoRoute(
      path: registerScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const ResisterScreen(),
    ),
  ],
);
