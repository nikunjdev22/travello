import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/app_validation.dart';
import 'package:travello/Utils%20/sizes.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import '../../../common/authButton.dart';
import '../../../common/text.dart';
import '../../../common/textformfield.dart';
import '../forget_password/forget_password.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TText(text: 'Welcome to'),
          TText(
            text: "Travel",
            fontSize: 36,
          ),
          TText(text: "Please login to continue"),
          SizedBox(
            height: TSizes.md,
          ),
          TTextField(
            text: 'Email / Username',
            controller: email,
            obscureText: false,
            validate: (value) => AppValidator.validateEmail(value),
          ),
          SizedBox(
            height: TSizes.md,
          ),
          TTextField(
            text: 'Password',
            controller: password,
            obscureText: true,
            validate: (value) => AppValidator.validatePassword(value),
          ),
          SizedBox(
            height: TSizes.lg,
          ),
          TAuthButton(
            text: 'LOGIN',
            shadowColor: AppColors.black.withOpacity(0.2),
            onPressed: () {
              if (loginFormKey.currentState!.validate()) {
                controller.login(email.text, password.text);
                return ;
              }
            }
          ),
          SizedBox(
            height: TSizes.md,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => Get.to(() => ForgetPassword()),
                child: Text(
                  "FORGOT PASSWORD?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
