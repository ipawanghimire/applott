import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/favourite_screen/fav_screen.dart';
import 'package:lotteryapp/view/screen/home_screen/home_screen.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/bottom_bar_item.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/bottom_nav_bar.dart';
import 'package:lotteryapp/view/screen/more_screen/more_screen.dart';
import 'package:lotteryapp/view/screen/pools_screen/pool_screen.dart';

/// main Screen of App
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        onPressFAB: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023, 1, 1),
            lastDate: DateTime(2023, 12, 31),
          );
        },
        centerNotched: true,
        fabIcon: Icon(
          Icons.date_range,
          size: 30,
          color: primaryColor,
        ),
        bottomItems: <BottomBarItem>[
          BottomBarItem(
            bottomItemSelectedColor: primaryColor,
            label: 'Home',
            screen: HomeScreen(),
            selectedIcon: Icons.home,
          ),
          BottomBarItem(
            bottomItemSelectedColor: primaryColor,
            label: 'Pools',
            screen: const PoolsScreen(),
            selectedIcon: Icons.roller_shades,
          ),
          BottomBarItem(
            bottomItemSelectedColor: primaryColor,
            label: 'Faviourate',
            selectedIcon: Icons.favorite,
            screen: const FavouriteScreen(),
          ),
          BottomBarItem(
            bottomItemSelectedColor: primaryColor,
            label: 'More',
            screen: MoreScreen(),
            selectedIcon: Icons.more_horiz,
          ),
        ],
      ),
    );
  }
}
