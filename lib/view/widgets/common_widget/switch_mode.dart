import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/custom_card.dart';

///
class SwitchModeWidget extends ConsumerWidget {
  const SwitchModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(darkModeProvider.notifier).state;

    return CupertinoSwitch(
      value: darkMode,
      onChanged: (value) => ref.read(darkModeProvider.notifier).state = value,
      activeColor: darkBlue,
    );
  }
}
