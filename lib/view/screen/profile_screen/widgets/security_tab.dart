import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';
import 'package:lotteryapp/view/widgets/common_widget/resuable_text_form.dart';

class SecurityTab extends StatelessWidget {
  const SecurityTab({
    required this.securityField1Controller,
    required this.securityField2Controller,
    required this.securityField3Controller,
    super.key,
  });
  final TextEditingController securityField1Controller;
  final TextEditingController securityField2Controller;
  final TextEditingController securityField3Controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.lock,
              color: whiteColor,
              size: 24,
            ),
            label: 'Previous Pin',
            controller: securityField1Controller,
          ),
          const SizedBox(height: 10),
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.lock,
              color: whiteColor,
              size: 24,
            ),
            label: 'Enter the Pin',
            controller: securityField2Controller,
          ),
          const SizedBox(height: 10),
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.lock,
              color: whiteColor,
              size: 24,
            ),
            label: 'Re-Enter the Pin',
            controller: securityField3Controller,
          ),
          ReusableButton(
            buttonColor: greenColor,
            title: 'Submit',
            topmargin: 40,
            onpressed: () {},
          ),
        ],
      ),
    );
  }
}
