import 'package:flutter/material.dart';
import 'package:lotteryapp/core/controller/api/login_api/login_service.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';
import 'package:lotteryapp/view/widgets/common_widget/resuable_text_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 30),
            margin: const EdgeInsets.symmetric(vertical: 200, horizontal: 30),
            decoration: BoxDecoration(
              color: whiteColor.withOpacity(0.85),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        AppImage.logo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ReusableTextFormField(
                      label: 'Email',
                      leftIcon: const Icon(
                        Icons.email,
                      ),
                      underlineColor: darkModeprimaryColor,
                      textColor: darkModeprimaryColor,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        }

                        // Email regex pattern
                        const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        final regex = RegExp(emailRegex);

                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReusableButton(
                      title: 'Reset',
                      buttonColor: darkModeprimaryColor,
                      textcolor: whiteColor,
                      topmargin: 30,
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          // Form is valid, proceed with login
                          final LoginService loginService = sl<LoginService>();
                          loginService.ForgetPassword(
                            emailController.text,
                            context,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
