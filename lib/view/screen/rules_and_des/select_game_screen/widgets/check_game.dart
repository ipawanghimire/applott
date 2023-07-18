import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_color.dart';

class CheckGame extends StatelessWidget {
  const CheckGame({super.key, this.title, this.isChecked = false});

  final String? title;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    // Create a StateProvider for the checkbox state.
    final checkboxState = StateProvider<bool>((_) => isChecked);

    return Consumer(
      builder: (context, ref, child) {
        // Get the current value of the checkbox state.
        final isChecked = ref.watch(checkboxState);

        // Return the checkbox and text widgets.
        return Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                ref.read(checkboxState.notifier).state = value!;
              },
            ),
            Text(
              '$title',
              style: myTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
