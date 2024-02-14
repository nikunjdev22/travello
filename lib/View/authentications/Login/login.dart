/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/string_constant.dart';
import '../../../Utils /sizes.dart';
import '../../../common/spacing_styles.dart';
import 'Widgets/form_divider.dart';
import 'Widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo,Title and SubTitle
              //const TLoginHeader(),
              /// Form
              const TLoginForm(),

              ///Divider
              TFormDivider(
                dividerText: AppString.orSignInWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Footer
              //const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import '../../../common/authButton.dart';
import '../../../common/text.dart';
import '../../../common/textformfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
        ),
        SizedBox(
          height: TSizes.md,
        ),
        TTextField(
          text: 'password',
          controller: password,
        ),
        SizedBox(
          height: TSizes.lg,
        ),
        TAuthButton(
          text: 'LOGIN',
          shadowColor: AppColors.black.withOpacity(0.2),
          onPressed: () =>  controller.login(email.text, password.text),
        ),
        SizedBox(
          height: TSizes.md,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
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
    );
  }
}
