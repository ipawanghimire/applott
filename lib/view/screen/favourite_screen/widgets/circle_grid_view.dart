import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_color.dart';

class CircleGridView extends ConsumerWidget {
  const CircleGridView({
    required this.itemCount,
    required this.circleSize,
    super.key,
  });
  final int itemCount;
  final double circleSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    final selectedNumbers = ref.watch(selectedNumbersProvider);

    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 6,
        crossAxisCount: 6, // Adjust the number of columns as needed
      ),
      itemBuilder: (context, index) {
        final number = index + 1;
        final isSelected = selectedNumbers.contains(number);
        final color = isSelected ? greenColor : onPrimary;

        return GestureDetector(
          onTap: () {
            ref.read(selectedNumbersProvider.notifier).state =
                _toggleNumberSelection(selectedNumbers, number);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Align(
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FadeAnimatedText(
                    '${index + 1}',
                    textStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<int> _toggleNumberSelection(List<int> selectedNumbers, int number) {
    return selectedNumbers.contains(number)
        ? selectedNumbers
            .where(
              (n) => n != number,
            )
            .toList()
        : [...selectedNumbers, number];
  }
}

final selectedNumbersProvider = StateProvider<List<int>>((ref) => []);
