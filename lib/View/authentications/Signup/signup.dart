import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Constant/image_constant.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import 'package:travello/common/authButton.dart';
import 'package:travello/common/textformfield.dart';
import '../../../Utils /sizes.dart';
import '../../../common/text.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final controller= Get.put(AuthController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TText(
          text: 'Sign up with',
          color: AppColors.primary,
        ),
        TText(
          text: 'HOMELAND',
          color: AppColors.primary,
          fontSize: 36,
        ),
        SizedBox(
          height: TSizes.md,
        ),
        TTextField(text: 'Enter Email / Username',controller: email),
        SizedBox(
          height: TSizes.md,
        ),
        TTextField(text: 'Password',controller: password),
        SizedBox(
          height: TSizes.lg,
        ),
        TAuthButton(
          text: "SIGN UP",
          color: AppColors.primary,
          buttonColor: AppColors.white,
          shadowColor: AppColors.primary.withOpacity(0.2),
          onPressed: () => AuthController.instance.register(email.text, password.text,),
        ),
        SizedBox(
          height: TSizes.lg,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TText(
              text: 'Or Signup with',
              color: AppColors.primary,
            ),
            SizedBox(
              height: TSizes.md,
            ),
            IconButton(
              onPressed: () => controller.signInWithGoogle(),
              icon: Image(
                height: TSizes.iconsLg,
                width: TSizes.iconsLg,
                image: AssetImage(AppImages.googleSignup),
              ),
            ),
          ],
        )
      ],
    );
  }
}
