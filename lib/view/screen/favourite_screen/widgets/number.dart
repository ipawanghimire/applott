import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/resources/app_color.dart';

final mySelectedNumbersProvider = StateProvider<List<int>>((ref) => []);

class MyNumber extends ConsumerWidget {
  const MyNumber({super.key, this.radius = 20, this.margin, this.padding});
  final double radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNumbers = ref.watch(mySelectedNumbersProvider);

    return Row(
      children: List.generate(
        6,
        (index) {
          final number = index + 1;
          final isSelected = selectedNumbers.contains(number);
          final color =
              isSelected ? greenColor : Theme.of(context).colorScheme.onPrimary;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(mySelectedNumbersProvider.notifier).state =
                    _toggleNumberSelection(selectedNumbers, number);
              },
              child: Container(
                padding: padding ?? const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: radius,
                  child: Align(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        ScaleAnimatedText(
                          '$number',
                          textStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<int> _toggleNumberSelection(List<int> numbers, int number) =>
      numbers.contains(number)
          ? numbers.where((n) => n != number).toList()
          : [...numbers, number];
}
