import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotteryapp/core/controller/api/login_api/login_service.dart';
import 'package:lotteryapp/core/routes/app_routes.dart';
import 'package:lotteryapp/helper/dependency_injection.dart';
import 'package:lotteryapp/resources/app_color.dart';
import 'package:lotteryapp/resources/app_images.dart';
import 'package:lotteryapp/view/widgets/card/custom_text.dart';
import 'package:lotteryapp/view/widgets/card/reusable_button.dart';
import 'package:lotteryapp/view/widgets/common_widget/resuable_text_form.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController =
        TextEditingController(text: '1aaaaaaa');
    final TextEditingController emailController =
        TextEditingController(text: 'admin@gmail.com');
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      // decoration: BoxDecoration(gradient: bodyGradient()),
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              margin: const EdgeInsets.symmetric(vertical: 120, horizontal: 30),
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
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: ReusableTextFormField(
                        leftIcon: const Icon(
                          Icons.email,
                          size: 20,
                          color: darkModeprimaryColor,
                        ),
                        label: 'Email',
                        textColor: darkModeprimaryColor,
                        underlineColor: darkModeprimaryColor,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          }

                          // Email regex pattern
                          const emailRegex =
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
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
                      child: ReusableTextFormField(
                        leftIcon: const Icon(
                          Icons.lock,
                          size: 20,
                          color: darkModeprimaryColor,
                        ),
                        label: 'Password',
                        textColor: darkModeprimaryColor,
                        underlineColor: darkModeprimaryColor,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.length < 7) {
                            return 'Please enter a Strong Password';
                          }
                          // Add any additional password validation logic here
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ReusableButton(
                        title: 'Login',
                        buttonColor: darkModeprimaryColor,
                        textcolor: whiteColor,
                        topmargin: 30,
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            // Form is valid, proceed with login
                            final LoginService loginService =
                                sl<LoginService>();
                            loginService.login(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {
                              context.push(forgetPassword);
                            },
                            child: CustomText(
                              title: 'Forget Password ?',
                              color: darkModeprimaryColor,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.push(registerScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: CustomText(
                              title: 'Sign Up',
                              color: darkModeprimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
