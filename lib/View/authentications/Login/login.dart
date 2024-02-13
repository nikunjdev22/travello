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
import '../../../common/authButton.dart';
import '../../../common/text.dart';
import '../../../common/textformfield.dart';
import '../../controller/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TText(text: 'Welcome to'),
        TText(text: "Travel", fontSize: 36,),
        TText(text: "Please login to continue"),
        SizedBox(
          height: TSizes.md,
        ),
        TTextField(text: 'Email / Username'),
        SizedBox(
          height: TSizes.md,
        ),
        TTextField(text: 'password'),
        SizedBox(
          height: TSizes.lg,
        ),
        TAuthButton(text: 'LOGIN',shadowColor: AppColors.black.withOpacity(0.2),),
        SizedBox(
          height: TSizes.md,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {} ,
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

