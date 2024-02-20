import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Constant/image_constant.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import 'package:travello/common/authButton.dart';
import 'package:travello/common/textformfield.dart';
import '../../../Utils /app_validation.dart';
import '../../../Utils /sizes.dart';
import '../../../common/text.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Form(
      key: signupFormKey ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          TTextField(text: 'Enter Email / Username', obscureText: false,controller: email,validate: (value) => AppValidator.validateEmail(value),),
          SizedBox(
            height: TSizes.md,
          ),
          TTextField(text: 'Password', obscureText: true,controller: password,validate: (value) => AppValidator.validatePassword(value),),
          SizedBox(
            height: TSizes.lg,
          ),
          TAuthButton(
            text: "SIGN UP",
            color: AppColors.primary,
            buttonColor: AppColors.white,
            shadowColor: AppColors.primary.withOpacity(0.2),
            onPressed: () {
              if (signupFormKey.currentState!.validate()) {
                AuthController.instance.register(
                  email.text,
                  password.text,
                );
                return;
              }
            }
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
      ),
    );
  }
}
