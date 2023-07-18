import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/view/widgets/common_widget/switch_mode.dart';

final darkModeProvider = StateProvider<bool>((ref) => true);

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.leadingIconPath,
    required this.title,
    super.key,
    this.onTap,
    this.showSwitchMode = false,
  });
  final String leadingIconPath;
  final String title;
  final VoidCallback? onTap;
  final bool showSwitchMode;

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        minLeadingWidth: 30,
        onTap: onTap,
        leading: Image.asset(
          leadingIconPath,
          color: onPrimary,
          width: 20,
          height: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: onPrimary,
          ),
        ),
        trailing: showSwitchMode ? const SwitchModeWidget() : null,
      ),
    );
  }
}
