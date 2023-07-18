import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotteryapp/view/screen/profile_screen/account_detail/account_detail_screen.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/p_info_tab.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/tab_bar_button.dart';

final isFirstTabSelectedProvider = StateProvider<bool>((ref) => true);

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController securityField1Controller =
      TextEditingController();
  final TextEditingController securityField2Controller =
      TextEditingController();
  final TextEditingController securityField3Controller =
      TextEditingController();
  final TextEditingController documentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final isFirstTabSelected =
                    ref.watch(isFirstTabSelectedProvider);
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TabBarButton(
                    text: 'Account Detail',
                    isSelected: isFirstTabSelected,
                    onPressed: () {
                      ref.read(isFirstTabSelectedProvider.notifier).state =
                          true;
                    },
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final isFirstTabSelected =
                    ref.watch(isFirstTabSelectedProvider);
                return TabBarButton(
                  text: 'Personal Information',
                  isSelected: !isFirstTabSelected,
                  onPressed: () {
                    ref.read(isFirstTabSelectedProvider.notifier).state = false;
                  },
                );
              },
            ),
          ],
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, _) {
              final isFirstTabSelected = ref.watch(isFirstTabSelectedProvider);
              return isFirstTabSelected
                  ? const AccountDetailScreen()
                  : CustomTabbedLayout(
                      emailController: emailController,
                      nameController: nameController,
                      addressController: addressController,
                      phoneController: phoneController,
                      genderController: genderController,
                      securityField1Controller: securityField1Controller,
                      securityField2Controller: securityField2Controller,
                      securityField3Controller: securityField3Controller,
                      documentController: documentController,
                    );
            },
          ),
        ),
      ],
    );
  }
}
