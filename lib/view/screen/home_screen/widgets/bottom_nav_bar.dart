import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/bottom_bar_item.dart';
import 'package:lotteryapp/view/screen/home_screen/widgets/notched_shape.dart';

///BottomNavBarScreen
class BottomNavBar extends StatefulWidget {
  ///initializing Constructor of bottom Nav Bar
  const BottomNavBar({
    required this.bottomItems,
    required this.fabIcon,
    this.fabChild,
    this.fabBackGroundColor,
    this.bottomNavBarColor,
    this.floatingActionButtonLocation,
    this.fabElevation,
    this.bottomNavItemSelectedIconSize,
    this.bottomNavItemunSelectedIconSize,
    this.bottomNavItemSelectedLabelSize,
    this.bottomNavItemunSelectedLabelSize,
    this.fabHeight,
    this.fabWidth,
    this.bottomItemLabelFontWeight,
    this.bottomNavItemHeight,
    this.bottomNavItemIconHeight,
    this.bottomNavItemLabelHeight,
    this.onPressFAB,
    this.notchedRadius,
    this.centerNotched = false,
    super.key,
  });

  ///list of BottomBarItem
  final List<BottomBarItem> bottomItems;
  //FAB LABEL
  final Widget? fabChild;

  ///floting action button color
  final Color? fabBackGroundColor;

  ///bottm navigation bar   color
  final Color? bottomNavBarColor;

  ///FAB Location
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// FAB ICON
  final Widget fabIcon;

  /// FAB elevation
  final double? fabElevation;

  /// FAB Height
  final double? fabHeight;

  /// FAB Width
  final double? fabWidth;

  ///buttom item selected size
  final double? bottomNavItemSelectedIconSize;

  ///buttom item unselected size
  final double? bottomNavItemunSelectedIconSize;

  ///buttom item selected size
  final double? bottomNavItemSelectedLabelSize;

  ///buttom item selected size
  final double? bottomNavItemLabelHeight;

  ///buttom item selected size
  final double? bottomNavItemIconHeight;

  ///buttom item unselected size
  final double? bottomNavItemunSelectedLabelSize;

  ///buttom item selected size
  final double? bottomNavItemHeight;

  /// bottomitem font weight
  final FontWeight? bottomItemLabelFontWeight;

  /// function for fab
  final Function()? onPressFAB;

  /// u want notched center or not
  final bool centerNotched;

  final double? notchedRadius;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

///Collector   Function

class _BottomNavBarState extends State<BottomNavBar> {
  int _pageIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index > (widget.bottomItems.length / 2) ? index - 1 : index;
    });

    if (_pageIndex == 0) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final int bottomItemLength = widget.bottomItems.length;
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      body: widget.bottomItems[_pageIndex].screen,
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: widget.fabHeight ?? 54,
        width: widget.fabWidth ?? 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.fabBackGroundColor ?? onPrimary,
          boxShadow: [
            BoxShadow(
              color: onPrimary,
              offset: const Offset(0, 2),
              blurRadius: widget.fabElevation ?? 16,
            ),
          ],
        ),
        child: IconButton(
          onPressed: widget.onPressFAB,
          icon: widget.fabIcon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(),
        child: BottomAppBar(
          shape: CenterNotchedShape(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                bottomItemLength + 1,
                (int index) => Expanded(
                  child: index == (bottomItemLength / 2)
                      ? Container(
                          height: widget.fabHeight ?? 45,
                          padding: const EdgeInsets.only(top: 15),
                          alignment: Alignment.bottomCenter,
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _pageIndex =
                                  index > (widget.bottomItems.length / 2)
                                      ? index - 1
                                      : index;
                            });
                            if (_pageIndex == 0) {
                              setState(() {});
                            }
                          },
                          child: SizedBox(
                            height: widget.bottomNavItemHeight ?? 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  height: widget.bottomNavItemIconHeight ??
                                      MediaQuery.of(context).size.height *
                                          0.029,
                                  child: widget
                                          .bottomItems[(index >
                                                  (widget.bottomItems.length /
                                                      2)
                                              ? index - 1
                                              : index)]
                                          .icon ??
                                      Icon(
                                        widget
                                            .bottomItems[(index >
                                                    (widget.bottomItems.length /
                                                        2)
                                                ? index - 1
                                                : index)]
                                            .selectedIcon,
                                        size: (index >
                                                        widget.bottomItems
                                                                .length /
                                                            2
                                                    ? index - 1
                                                    : index) ==
                                                _pageIndex
                                            ? widget.bottomNavItemSelectedIconSize ??
                                                28
                                            : widget.bottomNavItemunSelectedIconSize ??
                                                23,
                                        color: (index >
                                                        widget.bottomItems
                                                                .length /
                                                            2
                                                    ? index - 1
                                                    : index) ==
                                                _pageIndex
                                            ? widget.bottomItems[_pageIndex]
                                                .bottomItemSelectedColor
                                            : widget.bottomItems[_pageIndex]
                                                    .bottomItemUnSelectedColor ??
                                                greyColor,
                                      ),
                                ),
                                SizedBox(
                                  height: widget.bottomNavItemLabelHeight ?? 13,
                                  child: Text(
                                    widget
                                        .bottomItems[(index >
                                                (widget.bottomItems.length / 2)
                                            ? index - 1
                                            : index)]
                                        .label,
                                    style: TextStyle(
                                      color: (index >
                                                      widget.bottomItems
                                                              .length /
                                                          2
                                                  ? index - 1
                                                  : index) ==
                                              _pageIndex
                                          ? widget.bottomItems[_pageIndex]
                                              .bottomItemSelectedColor
                                          : widget.bottomItems[_pageIndex]
                                                  .bottomItemUnSelectedColor ??
                                              greyColor,
                                      fontWeight:
                                          widget.bottomItemLabelFontWeight ??
                                              FontWeight.w600,
                                      fontSize: (index >
                                                      widget.bottomItems
                                                              .length /
                                                          2
                                                  ? index - 1
                                                  : index) ==
                                              _pageIndex
                                          ? widget.bottomNavItemSelectedLabelSize ??
                                              10.5
                                          : widget.bottomNavItemunSelectedLabelSize ??
                                              10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
