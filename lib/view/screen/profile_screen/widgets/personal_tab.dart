import 'package:flutter/material.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/view/widgets/common_widget/resuable_text_form.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({
    required this.nameController,
    required this.addressController,
    required this.phoneController,
    required this.genderController,
    required this.emailController,
    super.key,
  });
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final TextEditingController genderController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.person,
              size: 24,
              color: whiteColor,
            ),
            label: 'Name',
            controller: nameController,
          ),
          const SizedBox(height: 10),
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.home,
              size: 24,
              color: whiteColor,
            ),
            label: 'Address',
            controller: addressController,
          ),
          const SizedBox(height: 10),
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.call,
              size: 24,
              color: whiteColor,
            ),
            label: 'Phone Number',
            controller: phoneController,
          ),
          const SizedBox(height: 10),
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.male,
              size: 28,
              color: whiteColor,
            ),
            label: 'Gender',
            controller: genderController,
          ),
          ReusableTextFormField(
            leftIcon: const Icon(
              Icons.email,
              size: 24,
              color: whiteColor,
            ),
            label: 'E-mail',
            controller: emailController,
          ),
        ],
      ),
    );
  }
}
