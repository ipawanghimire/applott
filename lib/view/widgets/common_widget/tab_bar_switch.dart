import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/tab_bar_button.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

///
class TabBarSwitch extends StatelessWidget {
  const TabBarSwitch({
    super.key,
    this.text1 = 'Game Acitivity',
    this.text2 = 'Funding History',
    this.text3 = 'Play for Free',
  });
  final String text1;
  final String text2;
  final String text3;

  void _onTabButtonPressed(WidgetRef ref, int index) {
    ref.read(selectedIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final selectedIndex = ref.watch(selectedIndexProvider);

        return Row(
          children: [
            TabBarButton(
              text: text1,
              isSelected: selectedIndex == 0,
              onPressed: () => _onTabButtonPressed(ref, 0),
            ),
            TabBarButton(
              text: text2,
              isSelected: selectedIndex == 1,
              onPressed: () => _onTabButtonPressed(ref, 1),
            ),
            TabBarButton(
              text: text3,
              isSelected: selectedIndex == 2,
              onPressed: () => _onTabButtonPressed(ref, 2),
            ),
          ],
        );
      },
    );
  }
}
