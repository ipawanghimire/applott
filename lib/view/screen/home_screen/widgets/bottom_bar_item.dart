import 'package:flutter/material.dart';

///this is a model for custom navigatorBar with following parameter
class BottomBarItem {
  ///initializing Constructor with BottomNavBarItem
  BottomBarItem({
    required this.label,
    required this.screen,
    this.selectedIcon,
    this.centerDockedTitle,
    this.bottomItemSelectedColor,
    this.icon,
  });

  ///screen of bottomNavigation Bar
  Widget screen;

  ///Selected Icon of a NavigationBar
  Widget? icon;

  ///Icon of bottom nav bar
  IconData? selectedIcon;

  ///selected item color
  Color? bottomItemSelectedColor;

  ///unselected bottomNav bar item color
  Color? bottomItemUnSelectedColor;

  ///label represts the title of NavBar
  String label;

  /// title for Floating action button
  String? centerDockedTitle;
}
